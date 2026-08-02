#!/usr/bin/env python3
"""Generate readable Markdown CVs from the project's TOML content files."""

from __future__ import annotations

import argparse
import re
import sys
import tomllib
from pathlib import Path
from typing import Any, Iterable


ROOT = Path(__file__).resolve().parents[1]
CONFIG_ROOT = ROOT / "config"
OUTPUT_ROOT = ROOT / "output" / "markdown"
DEFAULT_SECTION_ORDER = (
    "education",
    "experience",
    "publications",
    "patents",
    "projects",
    "skills",
    "artifacts",
    "awards",
    "serving",
    "summary",
)
DEFAULT_SECTION_TITLES = {
    "education": "Education",
    "experience": "Experience",
    "publications": "Publications",
    "patents": "Patents & Copyrights",
    "projects": "Projects",
    "skills": "Skills",
    "artifacts": "Artifacts",
    "awards": "Awards",
    "serving": "Serving",
    "summary": "Summary",
}


def source_files() -> list[Path]:
    sources = list(CONFIG_ROOT.glob("cv*.toml"))
    sources.extend(CONFIG_ROOT.glob("intl/*/cv*.toml"))
    return sorted(sources, key=lambda path: path.relative_to(ROOT).as_posix())


def output_path(source: Path) -> Path:
    return (OUTPUT_ROOT / source.relative_to(CONFIG_ROOT)).with_suffix(".md")


def rich(value: Any) -> str:
    """Convert the small Typst-rich-text subset used by the TOML files."""
    if value is None:
        return ""
    text = str(value).strip()
    text = re.sub(r'#smallcaps\("([^"]*)"\)', r"\1", text)
    text = text.replace(r"\@", "@")
    return text


def joined(values: Iterable[Any], separator: str = ", ") -> str:
    return separator.join(rich(value) for value in values if rich(value))


def people(values: Iterable[Any]) -> str:
    return joined(rich(value)[:-1] + r"\*" if rich(value).endswith("*") else value for value in values)


def period(text: str) -> str:
    if not text or text[-1] in ".!?。！？;；":
        return text
    return f"{text}."


def meta_line(*parts: Any) -> str:
    return " · ".join(rich(part) for part in parts if rich(part))


def date_range(entry: dict[str, Any]) -> str:
    start = rich(entry.get("start"))
    end = rich(entry.get("end"))
    if start and end:
        return f"{start} – {end}"
    return start or end


def details(lines: list[str], values: Any) -> None:
    if not values:
        return
    for value in values:
        text = rich(value)
        if text:
            lines.append(f"- {text}")
    lines.append("")


def render_header(lines: list[str], profile: dict[str, Any]) -> None:
    en_name = rich(profile.get("en_name"))
    original_name = rich(profile.get("original_name"))
    display_name = en_name or original_name or "Curriculum Vitae"
    lines.extend((f"# {display_name}", ""))

    identity = meta_line(original_name if original_name != display_name else "", profile.get("job_intent"))
    if identity:
        lines.extend((identity, ""))

    contact_items: list[str] = []
    for contact in profile.get("contacts", []):
        label = rich(contact.get("label"))
        url = rich(contact.get("url"))
        if label:
            contact_items.append(f"[{label}]({url})" if url else label)
    location = rich(profile.get("location_label"))
    if location:
        contact_items.append(location)
    if contact_items:
        lines.extend((" · ".join(contact_items), ""))

    summary = rich(profile.get("summary"))
    if summary:
        lines.extend((summary, ""))


def render_education(lines: list[str], section: dict[str, Any]) -> None:
    for raw_entry in section.values():
        entry = raw_entry if isinstance(raw_entry, dict) else {"institution": raw_entry}
        institution = rich(entry.get("institution"))
        lines.extend((f"### {institution}", ""))
        line = meta_line(entry.get("degree"), entry.get("date"))
        if line:
            lines.extend((line, ""))
        details(lines, entry.get("details"))


def render_work(lines: list[str], section: dict[str, Any], title_key: str) -> None:
    for raw_entry in section.values():
        entry = raw_entry if isinstance(raw_entry, dict) else {title_key: raw_entry}
        title = rich(entry.get(title_key))
        lines.extend((f"### {title}", ""))
        organization = joined((entry.get("org"), entry.get("location")))
        line = meta_line(entry.get("role"), organization, date_range(entry))
        if line:
            lines.extend((line, ""))
        stack = entry.get("stack")
        if stack:
            stack_text = joined(stack) if isinstance(stack, list) else rich(stack)
            lines.extend((f"**Stack:** {stack_text}", ""))
        summary = rich(entry.get("summary"))
        if summary:
            lines.extend((summary, ""))
        details(lines, entry.get("details"))


def render_publications(lines: list[str], section: dict[str, Any]) -> None:
    for index, raw_entry in enumerate(section.values(), 1):
        entry = raw_entry if isinstance(raw_entry, dict) else {"title": raw_entry}
        title = rich(entry.get("title"))
        pdf = rich(entry.get("pdf"))
        title = f"[{title}]({pdf})" if pdf else title
        lines.extend((f"{index}. **{title}**", ""))
        authors = people(entry.get("authors", []))
        if authors:
            lines.extend((f"   {authors}", ""))
        venue = rich(entry.get("venue"))
        published = rich(entry.get("published"))
        publication = meta_line(f"*{venue}*" if venue else "", published, entry.get("metadata"))
        if publication:
            lines.extend((f"   {publication}", ""))
        doi = rich(entry.get("DOI"))
        if doi:
            lines.extend((f"   DOI: [{doi}](https://doi.org/{doi})", ""))
        tldr = rich(entry.get("tldr"))
        if tldr:
            lines.extend((f"   {tldr}", ""))


def render_patents(
    lines: list[str],
    patents: dict[str, Any],
    copyrights: dict[str, Any],
    titles: dict[str, Any],
) -> None:
    patents_sub = rich(titles.get("patents_sub"))
    if patents and patents_sub:
        lines.extend((f"### {patents_sub}", ""))
    for index, raw_entry in enumerate(patents.values(), 1):
        entry = raw_entry if isinstance(raw_entry, dict) else {"title": raw_entry}
        title = rich(entry.get("title"))
        number = rich(entry.get("number"))
        lines.extend((f"{index}. **{title}**", ""))
        inventors = people(entry.get("inventors", []))
        if inventors:
            lines.extend((f"   {inventors}", ""))
        metadata = meta_line(number, entry.get("country"), entry.get("filed"), entry.get("status"))
        if metadata:
            lines.extend((f"   {metadata}", ""))

    copyrights_sub = rich(titles.get("copyrights_sub"))
    if copyrights and copyrights_sub:
        lines.extend((f"### {copyrights_sub}", ""))
    for index, raw_entry in enumerate(copyrights.values(), 1):
        entry = raw_entry if isinstance(raw_entry, dict) else {"title": raw_entry}
        title = rich(entry.get("title"))
        lines.extend((f"{index}. **{title}**", ""))
        holders = people(entry.get("holders", []))
        if holders:
            lines.extend((f"   {holders}", ""))
        metadata = meta_line(entry.get("country"), entry.get("year"), entry.get("status"))
        if metadata:
            lines.extend((f"   {metadata}", ""))


def render_skills(lines: list[str], section: dict[str, Any]) -> None:
    for key, raw_entry in section.items():
        entry = raw_entry if isinstance(raw_entry, dict) else {"label": key, "items": [raw_entry]}
        label = rich(entry.get("label")) or key
        values = []
        for item in entry.get("items", []):
            if isinstance(item, dict):
                value = rich(item.get("text") or item.get("name"))
            else:
                value = rich(item)
            if value:
                values.append(value)
        lines.extend((f"- **{label}:** {joined(values)}", ""))


def render_artifacts(lines: list[str], section: dict[str, Any]) -> None:
    for raw_entry in section.values():
        entry = raw_entry if isinstance(raw_entry, dict) else {"name": raw_entry}
        name = rich(entry.get("name"))
        description = period(rich(entry.get("description")))
        metadata = meta_line(joined(entry.get("tech", [])), entry.get("year"))
        suffix = f" {description}" if description else ""
        if metadata:
            suffix += f" {metadata}."
        lines.extend((f"- **{name}.**{suffix}", ""))


def render_awards(lines: list[str], section: dict[str, Any]) -> None:
    for raw_entry in section.values():
        entry = raw_entry if isinstance(raw_entry, dict) else {"name": raw_entry}
        name = rich(entry.get("name"))
        metadata = meta_line(entry.get("from"), entry.get("date"), entry.get("details"))
        suffix = f" — {metadata}" if metadata else ""
        lines.extend((f"- **{name}**{suffix}", ""))


def render_serving(lines: list[str], section: dict[str, Any]) -> None:
    for raw_entry in section.values():
        entry = raw_entry if isinstance(raw_entry, dict) else {"name": raw_entry}
        name = rich(entry.get("name"))
        metadata = meta_line(entry.get("description"), entry.get("date"))
        suffix = f" — {metadata}" if metadata else ""
        lines.extend((f"- **{name}**{suffix}", ""))


def section_order(data: dict[str, Any], titles: dict[str, Any]) -> list[str]:
    configured = [key for key in titles if key in DEFAULT_SECTION_ORDER]
    discovered = [key for key in DEFAULT_SECTION_ORDER if key in data and key not in configured]
    return configured + discovered


def generate(source: Path) -> str:
    with source.open("rb") as handle:
        data = tomllib.load(handle)

    relative_source = source.relative_to(ROOT).as_posix()
    lines = [f"<!-- Generated from {relative_source} by scripts/generate_markdown.py. -->", ""]
    profile = data.get("profile", data.get("metadata", {}))
    titles = data.get("sections", {})
    render_header(lines, profile)

    for section_name in section_order(data, titles):
        section = data.get(section_name)
        if not section:
            continue
        title = rich(titles.get(section_name)) or DEFAULT_SECTION_TITLES[section_name]
        lines.extend((f"## {title}", ""))
        if section_name == "education":
            render_education(lines, section)
        elif section_name == "experience":
            render_work(lines, section, "project")
        elif section_name == "publications":
            render_publications(lines, section)
        elif section_name == "patents":
            render_patents(lines, section, data.get("copyrights", {}), titles)
        elif section_name == "projects":
            render_work(lines, section, "title")
        elif section_name == "skills":
            render_skills(lines, section)
        elif section_name == "artifacts":
            render_artifacts(lines, section)
        elif section_name == "awards":
            render_awards(lines, section)
        elif section_name == "serving":
            render_serving(lines, section)
        elif section_name == "summary":
            summary = rich(section)
            if summary:
                lines.extend((summary, ""))

    return "\n".join(lines).rstrip() + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="store_true",
        help="report missing or stale Markdown files without changing them",
    )
    args = parser.parse_args()

    stale: list[Path] = []
    for source in source_files():
        destination = output_path(source)
        content = generate(source)
        if args.check:
            if not destination.exists() or destination.read_text(encoding="utf-8") != content:
                stale.append(destination)
            continue
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(content, encoding="utf-8")
        print(destination.relative_to(ROOT))

    if stale:
        for destination in stale:
            print(f"stale: {destination.relative_to(ROOT)}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
