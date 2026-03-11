#import "components/ui.typ": icons-enabled
#import "@preview/rubby:0.10.2": get-ruby

#let heading-size-override = state("heading-size-override", none)
#let subheading-size-override = state("subheading-size-override", none)
#let list-size-override = state("list-size-override", none)
#let text-size-override = state("text-size-override", none)
#let title-font-override = state("title-font-override", none)

#let cv(
  en_name: "",
  original_name: "",
  furigana_name: none,
  furigana: none,
  address: "",
  contacts: (),
  updated: datetime.today(),
  lang: "en",
  show_furigana: true,
  page_margin_top: 1.25cm,
  page_margin_bottom: 1.25cm,
  page_margin_left: 1.5cm,
  page_margin_right: 1.5cm,
  text_size: 10pt,
  heading_size: 12pt,
  subheading_size: 10.5pt,
  list_size: 9pt,
  font_content: "Spectral",
  font_content_cjk: "Noto Serif SC",
  font_title: "Rethink Sans",
  font_title_cjk: "IBM Plex Sans",
  name_font: none,
  font_mono: "Inconsolata",
  font_math: "New Computer Modern Math",
  header_name_size: 18pt,
  header_name_weight: "bold",
  header_original_name_size: 15.3pt,
  header_original_name_weight: "black",
  header_alignment: "center",
  header_job_intent: none,
  header_job_intent_size: 10.5pt,
  header_contact_size: 9pt,
  header_show_avatar: false,
  header_avatar_size: 1.8cm,
  header_avatar_path: none,
  footer_size: 8pt,
  footer_show_name: true,
  footer_text: none,
  footer_show_updated: true,
  footer_updated_prefix: "Last Updated:",
  footer_show_page: true,
  footer_page_format: "1 of 1",
  icons_enabled: true,
  body,
) = {
  context { icons-enabled.update(icons_enabled) }
  let full_name_text = if original_name != "" { en_name + "  " + original_name } else { en_name }
  let resolved-furigana-name = if furigana_name == none or furigana_name == "" { original_name } else { furigana_name }
  let resolved-furigana = furigana

  let ruby = get-ruby(
    size: 0.4em, // Ruby font size (made smaller)
    dy: 2pt, // Vertical offset of the ruby
    pos: top, // Ruby position (top or bottom)
    alignment: "center", // Ruby alignment ("center", "start", "between", "around")
    delimiter: "|", // The delimiter between words
    auto-spacing: true, // Automatically add necessary space around words
  )

  set document(author: full_name_text, title: full_name_text, date: updated)

  let font_configs = (
    content: (
      (name: font_content, covers: "latin-in-cjk"),
      (name: font_content_cjk),
    ),
    title: (
      (name: font_title, covers: "latin-in-cjk"),
      (name: font_title_cjk),
    ),
    mono: (
      (name: font_mono, covers: "latin-in-cjk"),
    ),
    math: font_math,
  )
  let original-name-font = if name_font == none or name_font == "" {
    font_configs.content
  } else {
    (
      (name: name_font, covers: "latin-in-cjk"),
      (name: font_content_cjk),
    )
  }

  show raw: it => box(
    text(font: font_configs.mono, weight: 500, it, size: 1.15em),
  )

  show link: it => underline(
    stroke: (dash: "dashed"),
    offset: 0.2em,
  )[#it]

  show strong: it => {
    let strong-weight = if font_content == "MiSans" or font_content_cjk == "MiSans" {
      "semibold"
    } else {
      "bold"
    }
    text(weight: strong-weight, it.body)
  }

  show list: it => context {
    let section-list-size = list-size-override.get()
    set text(size: if section-list-size == none { list_size } else { section-list-size })
    it
  }

  show list: set list(
    marker: [◦],
    spacing: 1em,
    body-indent: 0.5em,
  )

  show: doc => {
    set text(
      size: text_size,
      lang: lang,
      font: font_configs.content,
      fill: luma(20%),
    )
    doc
  }

  show heading.where(level: 1): it => context {
    let section-heading-size = heading-size-override.get()
    let section-title-font = title-font-override.get()
    pad(
      top: 0pt,
      bottom: 0.6em,
      text(
        font: if section-title-font == none { font_configs.title } else { section-title-font },
        size: if section-heading-size == none { heading_size } else { section-heading-size },
        weight: "black",
        it.body,
      ),
    )
  }
  show heading.where(level: 2): it => context {
    let section-subheading-size = subheading-size-override.get()
    let section-title-font = title-font-override.get()
    pad(
      top: -0.2em,
      bottom: 0.3em,
      text(
        font: if section-title-font == none { font_configs.title } else { section-title-font },
        size: if section-subheading-size == none { subheading_size } else { section-subheading-size },
        weight: "bold",
        it.body,
      ),
    )
  }

  set par(justify: true)

  set page(
    margin: (top: page_margin_top, bottom: page_margin_bottom, left: page_margin_left, right: page_margin_right),
    footer: [
      #align(center)[
        #text(
          size: footer_size,
          fill: luma(40%),
        )[
          #{
            let footer-items = ()
            if footer_show_name and en_name != none and en_name != "" {
              footer-items.push([*#en_name*])
            }
            if footer_text != none and footer_text != "" {
              footer-items.push([#footer_text])
            }
            if footer_show_updated {
              if footer_updated_prefix != none and footer_updated_prefix != "" {
                footer-items.push([#footer_updated_prefix #updated.display("[month repr:short] [year]")])
              } else {
                footer-items.push([#updated.display("[month repr:short] [year]")])
              }
            }
            if footer_show_page {
              footer-items.push([#context { counter(page).display(footer_page_format, both: true) }])
            }
            let separator = [#h(0.4em)-#h(0.4em)]
            footer-items.join(separator)
          }
        ]
      ]
    ],
  )

  let header-align = if header_alignment == "left" { start } else { center }
  let contact-info = contacts
  if address != none and address != "" {
    contact-info.push([#smallcaps(address)])
  }
  let contact-items = contact-info.map(item => box(baseline: 32%)[#item])
  let original-name-content = {
    let show-ruby = (
      show_furigana and resolved-furigana != none and resolved-furigana != ""
      and resolved-furigana-name != none and resolved-furigana-name != ""
      and resolved-furigana.contains("|") and resolved-furigana-name.contains("|")
    )
    if show-ruby {
      text(font: original-name-font, size: header_original_name_size, weight: header_original_name_weight)[#ruby[#resolved-furigana][#resolved-furigana-name]]
    } else {
      text(
        original_name,
        font: original-name-font,
        size: header_original_name_size,
        weight: header_original_name_weight,
      )
    }
  }
  let header-info = [
    #if header_alignment == "left" {
      stack(
        dir: ttb,
        spacing: 0.1em,
        text(size: header_name_size, weight: header_name_weight, font: font_configs.content)[#smallcaps(en_name)],
        block([
          #if original_name != none and original_name != "" {
            original-name-content
          }
          #if header_job_intent != none {
            h(0.55em)
            text(size: header_job_intent_size, weight: "medium", fill: luma(45%))[#header_job_intent]
          }
        ]),
      )
    } else {
      block(text(size: header_name_size, weight: header_name_weight, font: font_configs.content, [
        #smallcaps(en_name)
        #if original_name != none and original_name != "" {
          [#h(0.4em)#original-name-content]
        }
        #if header_job_intent != none {
          [#h(0.55em)#text(size: header_job_intent_size, weight: "medium", fill: luma(45%))[#header_job_intent]]
        }
      ]))
    }
    #if contact-items.len() > 0 {
      pad(
        top: 2pt,
        align(header-align)[
          #set text(size: header_contact_size)
          #contact-items.join(h(0.75em))
        ],
      )
    }
  ]
  context {
    let header-info-height = measure(header-info).height
    let header-avatar = if header_avatar_path != none and header_avatar_path != "" {
      block(
        radius: 18%,
        clip: true,
        inset: 0pt,
      )[
        #image(header_avatar_path, height: header-info-height)
      ]
    } else {
      rect(
        width: header_avatar_size,
        height: header-info-height,
        radius: 18%,
        inset: 0pt,
        fill: rgb("#f6f1e8"),
        stroke: (paint: rgb("#d6cab5"), thickness: 0.8pt),
      )[
        #place(center + horizon)[
          #text(size: 7pt, weight: "medium", fill: luma(55%))[PHOTO]
        ]
      ]
    }

    if header_show_avatar {
      grid(
        columns: (1fr, auto),
        column-gutter: 0.8cm,
        align: (start, top),
        align(top + header-align)[#header-info],
        align(top + right)[#header-avatar],
      )
    } else {
      align(header-align)[#header-info]
    }
  }

  body
}
