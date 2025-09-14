# Xyndrome-CV

A curriculum vitae template package written in Typst.

## Usage

This is a Typst package. You can use it by importing it in your Typst document:

```typ
#import "@preview/xyndrome:0.1.0": *
```

Or for local development:

```typ
#import "xyndrome/lib.typ": *
```

The `main.typ` file serves as an example and preview document showing how to use the package.

### Basic Usage Example

```typ
#import "xyndrome/lib.typ": *
#import "@preview/scienceicons:0.1.0": email-icon, github-icon

#show: cv.with(
  en_name: "Your Name",
  original_name: "你的名字", // Optional: for non-English names
  lang: "en", // "zh", "ja", "ko" supported
  contacts: (
    contact(
      icon: email-icon,
      label: "your.email@example.com",
      url: "mailto:your.email@example.com",
    ),
    contact(
      icon: github-icon,
      label: "yourusername",
      url: "https://github.com/yourusername",
    ),
  ),
)

= Education

#edu(
  institution: "Your University",
  location: "City, Country",
  gpa: "3.8/4.0",
  degrees: ("B.S. in Computer Science",),
  date: "2020-2024",
)
```

### Preview

To preview the document, simply compile `main.typ`:

```bash
typst compile main.typ
```

Or use watch mode for live preview:

```bash
typst watch main.typ
```

## Package Structure

- `xyndrome/lib.typ` - Main entry point for the package
- `xyndrome/core.typ` - Core CV components and functions
- `xyndrome/components.typ` - Additional UI components
- `xyndrome/icons.typ` - Icon definitions
- `xyndrome/extra.typ` - Extra utilities and functions
- `xyndrome/bib.typ` - Bibliography-related functions
- `main.typ` - Example/preview document

## Icons

- [Mingcute](https://mingcute.com/) - Open source icon library.

## Reference

- [Anthony Fu - CV](https://resume.antfu.me/)

## License

- [MIT License](./LICENSE)