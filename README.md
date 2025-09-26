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

The CV is available in multiple languages, located in the `intl/` directory:

#### Japanese (日本語)
```bash
typst compile intl/ja/main-ja.typ intl/ja/cv-ja.pdf
```

#### Simplified Chinese (简体中文)
```bash
typst compile intl/zh-cn/main-zh-cn.typ intl/zh-cn/cv-zh-cn.pdf
```

#### Traditional Chinese / Cantonese (繁體中文/粵語)
```bash
typst compile intl/zh-hk/main-zh-hk.typ intl/zh-hk/cv-zh-hk.pdf
```

#### Korean (한국어)
```bash
typst compile intl/ko/main-ko.typ intl/ko/cv-ko.pdf
```

### Directory Structure

```
xyndrome-cv/
├── main.typ                 # English version
├── intl/                    # International versions
│   ├── ja/                  # Japanese
│   │   └── main-ja.typ
│   ├── zh-cn/               # Simplified Chinese
│   │   └── main-zh-cn.typ
│   ├── zh-hk/               # Traditional Chinese/Cantonese
│   │   └── main-zh-hk.typ
│   └── ko/                  # Korean
│       └── main-ko.typ
├── xyndrome/                # Template package
│   ├── lib.typ              # Main library
│   ├── core.typ             # Core CV template
│   ├── icons.typ            # Icon definitions
│   ├── utils.typ            # Utility functions
│   └── components/          # CV components
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