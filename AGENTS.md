Always record reusable project rules here after structural/template changes.

## Current Architecture

- Main renderer entry is `xyndrome/cv.typ` (not `cv-from-toml.typ`).
- Section implementations live in `xyndrome/sections/`.
- Reusable UI components live in `xyndrome/components/ui.typ`.
- Shared non-visual helpers live in `xyndrome/utils.typ`.
- `xyndrome/lib.typ` re-exports from `sections/index.typ` and `components/ui.typ`.
- Header and footer renderers live in `xyndrome/sections/header.typ` and `xyndrome/sections/footer.typ`.
- `xyndrome/sections/common.typ` was removed; heading-gap state/reset is no longer used.
- Summary section implementation lives in `xyndrome/sections/summary.typ`.
- Typography override states (`heading-size-override`, `subheading-size-override`, `list-size-override`, `title-font-override`) are declared in both `xyndrome/cv.typ` and `xyndrome/core.typ` with the same state keys.

## Folder Rules

- `intl/` must contain TOML files only.
- Bundled Typst font assets live under `fonts/`.
- Reusable non-font binary assets such as profile images live under `assets/`.
- Vendored static Mi Sans TTFs for Simplified Chinese live under `fonts/misans/static/`.
- Use the static `MiSans` family for Typst; do not rely on the variable font file because Typst does not support VF here.
- Language entry `.typ` files are at repo root:
  - `main-ja.typ`
  - `main-zh-cn.typ`
  - `main-zh-hk.typ`
  - `main-ko.typ`

## Config/Data Rules

- Runtime config file is `config.toml`.
- `config.toml` sections:
  - `[page]`
  - `[global]`
  - `[header]`
  - `[footer]`
  - `[sections.default]` and optional `[sections.<section-name>]`
- Global typography config uses:
  - `global.font_title` + `global.font_title_cjk` for headings/subheadings
  - `global.font_content` + `global.font_content_cjk` for body text
  - `global.name_font` only for `profile.original_name` in the header
- Section style config supports inherited overrides for:
  - `text_size`
  - `heading_size`
  - `subheading_size`
  - `list_size`
  - `font_title` + `font_title_cjk`
  - `font_content` + `font_content_cjk`
- Section style blocks apply to every rendered section name, including nested rendered content such as `[sections.copyrights]`.
- Publication numbering is fixed to `Spectral` for `journal`, `patents`, and `software`; it must not inherit `font_content` overrides.
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
- Header config supports:
  - `alignment` with `center` or `left`
  - `show_avatar` + `avatar_size` for a right-side placeholder avatar block
  - `avatar_path` for a header image asset
  - `job_intent_size` for inline `profile.job_intent` text after `original_name`
- Profile supports optional `job_intent` for header-only intent text.
- `create-icon` in `xyndrome/icons.typ` supports per-side `inset` padding and full `outset` spacing (`left`/`right`/`top`/`bottom`) via native `box(..., outset: ...)`.
- Specific icon wrappers should be defined via `create-icon.with(...)` (or alias `.with(...)`) to avoid duplicated default parameter signatures; keep `inset`/`outset` only on `create-icon`.

## Page Config Rules

- `[page]` supports margin settings as strings with explicit units (e.g. `"1.25cm"`, `"0.5in"`, `"12pt"`):
  - `margin_top` (default `"1.25cm"`)
  - `margin_bottom` (default `"1.25cm"`)
  - `margin_left` (default `"1.5cm"`)
  - `margin_right` (default `"1.5cm"`)
- Parsed by `parse-length` in `xyndrome/utils.typ`, which also accepts plain numbers (treated as pt).

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
- Simplified Chinese uses vendored Mi Sans. Add `--font-path fonts` unless Mi Sans is installed system-wide.
- Simplified Chinese: `typst compile --root . --font-path fonts main-zh-cn.typ cv-zh-cn.pdf`
- Traditional Chinese/Cantonese: `typst compile --root . main-zh-hk.typ cv-zh-hk.pdf`
- Korean: `typst compile --root . main-ko.typ cv-ko.pdf`
