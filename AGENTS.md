Always record reusable project rules here after structural/template changes.

## Current Architecture

- Main renderer entry is `xyndrome/cv.typ` (not `cv-from-toml.typ`).
- Section implementations live in `xyndrome/sections/`.
- Reusable UI components live in `xyndrome/components/ui.typ`.
- Shared non-visual helpers live in `xyndrome/utils.typ`.
- `xyndrome/lib.typ` re-exports from `sections/index.typ` and `components/ui.typ`.

## Folder Rules

- `intl/` must contain TOML files only.
- Language entry `.typ` files are at repo root:
  - `main-ja.typ`
  - `main-zh-cn.typ`
  - `main-zh-hk.typ`
  - `main-ko.typ`

## Config/Data Rules

- Runtime config file is `config.toml`.
- `config.toml` sections:
  - `[global]`
  - `[header]`
  - `[footer]`
  - `[sections.default]` and optional `[sections.<section-name>]`
- Profile and CV content are in each CV TOML (for example `cv-1p.toml`).
- Furigana fields in profile:
  - `original_name`
  - `furigana_name`
  - `furigana`
- Furigana toggle is `global.show_furigana`.
  - `true`: render `furigana` over `furigana_name`
  - `false`: render `original_name`
- Experience entries support optional `stack` text.
  - Experience header layout is two grids:
  - line 1: `project` (left), `stack` + `time` (right, stack before time)
  - line 2: `role` (left), `place` (right, from `org` and `location`)
  - `stack` can be comma-separated text (or array) and each stack token renders as mono; commas remain serif.
- Header contacts are rendered as boxed inline items with explicit baseline and spacing for vertical centering consistency.
- `create-icon` in `xyndrome/icons.typ` supports per-side `inset` padding and full `outset` spacing (`left`/`right`/`top`/`bottom`) via native `box(..., outset: ...)`.
- Specific icon wrappers should be defined via `create-icon.with(...)` (or alias `.with(...)`) to avoid duplicated default parameter signatures; keep `inset`/`outset` only on `create-icon`.

## Footer Rules

- Footer config supports:
  - `show_name`
  - `text`
  - `show_updated` + `updated_prefix`
  - `show_page` + `page_format`
- Keep online CV text in footer `text` by default.

## Skills Badge Rules

- Skills `items` can be plain strings or dictionaries.
- Badge format:
  - `{ text = "vLLM", category = "LLM Inference" }`

## Naming Rules

- `recognition.typ` was renamed to `awards.typ`.
- Use `sections/` naming for section-level render logic.
- Keep real UI components in `components/`.

## Validation Commands

- English: `typst compile main.typ`
- Japanese: `typst compile --root . main-ja.typ cv-ja.pdf`
- Simplified Chinese: `typst compile --root . main-zh-cn.typ cv-zh-cn.pdf`
- Traditional Chinese/Cantonese: `typst compile --root . main-zh-hk.typ cv-zh-hk.pdf`
- Korean: `typst compile --root . main-ko.typ cv-ko.pdf`
