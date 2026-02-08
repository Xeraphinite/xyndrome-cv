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
typst compile main.typ
```

### International Versions

Language data is stored in `intl/` as TOML files. Entry `.typ` files are at project root:

#### Japanese (日本語)
```bash
typst compile --root . main-ja.typ cv-ja.pdf
```

#### Simplified Chinese (简体中文)
```bash
typst compile --root . main-zh-cn.typ cv-zh-cn.pdf
```

#### Traditional Chinese / Cantonese (繁體中文/粵語)
```bash
typst compile --root . main-zh-hk.typ cv-zh-hk.pdf
```

#### Korean (한국어)
```bash
typst compile --root . main-ko.typ cv-ko.pdf
```

### Directory Structure

```
xyndrome-cv/
├── main.typ                 # English version
├── main-ja.typ              # Japanese entrypoint
├── main-zh-cn.typ           # Simplified Chinese entrypoint
├── main-zh-hk.typ           # Traditional Chinese/Cantonese entrypoint
├── main-ko.typ              # Korean entrypoint
├── intl/                    # International TOML data only
│   ├── ja/                  # Japanese
│   │   └── cv-ja.toml
│   ├── zh-cn/               # Simplified Chinese
│   │   └── cv-zh-cn.toml
│   ├── zh-hk/               # Traditional Chinese/Cantonese
│   │   └── cv-zh-hk.toml
│   └── ko/                  # Korean
│       └── cv-ko.toml
├── xyndrome/                # Template package
│   ├── lib.typ              # Main library
│   ├── core.typ             # Core CV template
│   ├── cv.typ               # TOML renderer
│   ├── icons.typ            # Icon definitions
│   ├── utils.typ            # Helper utilities
│   ├── components/          # Reusable UI components
│   └── sections/            # CV sections and renderers
└── README.md
```

## Fonts & icons

We use the following open-source fonts:

- Serif: [Spectral](https://github.com/productiontype/Spectral)
- Sans: [Rethink Sans](https://github.com/hans-thiessen/Rethink-Sans)
- Fixed Width: [Inconsolata](https://github.com/googlefonts/Inconsolata)

Icons are from [Mingcute](https://www.mingcute.com/).

## License

© 2025 Xeraphinite - MIT License. See the [LICENSE](LICENSE) file for details.
