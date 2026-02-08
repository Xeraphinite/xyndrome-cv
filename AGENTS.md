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
