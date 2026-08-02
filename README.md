# Xyndrome-CV

A modern, pixel-perfect, and highly customizable CV/resume template built with Typst.

## Features

- Out-of-the-box support for great typography and layout with sensible defaults for fonts, sizes, and spacing.
- Components for common CV sections like education, experience, skills, and publications.
- CJK (Chinese, Japanese, Korean) character support.
- Multi-language support with pre-built internationalization versions.

## Usage

### Building the English Version

To build the main English CV:

```bash
typst compile main.typ output/main.pdf
```

### International Versions

Localized CV data is stored under `config/intl/`. Its entry `.typ` files are under `intl/<locale>/typ/`:

#### Japanese (日本語)
```bash
typst compile --root . intl/ja/typ/cv-ja.typ output/cv-ja.pdf
```

#### Simplified Chinese (简体中文)
```bash
typst compile --root . --font-path fonts intl/zh-cn/typ/cv-zh-cn.typ output/cv-zh-cn.pdf
```

#### Traditional Chinese / Cantonese (繁體中文/粵語)
```bash
typst compile --root . intl/zh-hk/typ/cv-zh-hk.typ output/cv-zh-hk.pdf
```

#### Korean (한국어)
```bash
typst compile --root . intl/ko/typ/cv-ko.typ output/cv-ko.pdf
```

### Markdown Versions

Readable Markdown counterparts for every English and localized CV variant are generated under `output/markdown/`. Their paths mirror the TOML sources under `config/`.

```bash
python3 scripts/generate_markdown.py
python3 scripts/generate_markdown.py --check
```

### Directory Structure

```
xyndrome-cv/
├── main.typ                  # English entrypoint
├── config/                   # Runtime config and CV TOML data
│   ├── config.toml
│   ├── cv.toml
│   └── intl/                 # Localized CV data
├── intl/                     # Localized Typst entrypoints
│   ├── ja/typ/
│   ├── zh-cn/typ/
│   ├── zh-hk/typ/
│   └── ko/typ/
├── output/                   # Generated artifacts
│   ├── *.pdf
│   └── markdown/             # Generated Markdown CV variants
├── fonts/                    # Bundled local fonts for Typst
├── scripts/
│   └── generate_markdown.py  # TOML-to-Markdown generator
├── xyndrome/                 # Template package
│   ├── lib.typ               # Main library
│   ├── core.typ              # Core CV template
│   ├── cv.typ                # TOML renderer
│   ├── icons.typ             # Icon definitions
│   ├── utils.typ             # Helper utilities
│   ├── components/           # Reusable UI components
│   └── sections/             # CV sections and renderers
└── README.md
```

## Fonts & icons

Bundled project fonts:

- Simplified Chinese body text uses static Xiaomi HyperOS MiSans TTFs from `fonts/misans/static/`.
- Use the `MiSans` family in Typst; do not rely on the variable font file.
- When building with bundled fonts, include `--font-path fonts` unless the same font is already installed system-wide.

We use the following open-source fonts:

- Serif: [Spectral](https://github.com/productiontype/Spectral)
- Sans: [Rethink Sans](https://github.com/hans-thiessen/Rethink-Sans)
- Fixed Width: [Inconsolata](https://github.com/googlefonts/Inconsolata)

Icons are from [Mingcute](https://www.mingcute.com/).

## License

© 2025 Xeraphinite - MIT License. See the [LICENSE](LICENSE) file for details.
