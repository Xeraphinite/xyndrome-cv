#import "components/common.typ": heading-gap, reset-heading-gap
#import "@preview/rubby:0.10.2": get-ruby

#let cv(
  en_name: "",
  original_name: "",
  ruby_name: none,
  address: "",
  contacts: (),
  updated: datetime.today(),
  lang: "en",
  body,
) = {
  let full_name_text = if original_name != "" { en_name + "  " + original_name } else { en_name }

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
    serif: (
      (name: "Spectral", covers: "latin-in-cjk"),
      (name: "Noto Serif SC"),
    ),
    sans: (
      (name: "Rethink Sans", covers: "latin-in-cjk"),
    ),
    mono: (
      (name: "Inconsolata", covers: "latin-in-cjk"),
    ),
    math: "New Computer Modern Math",
  )

  show raw: it => box(
    text(font: font_configs.mono, weight: 500, it, size: 1.2em),
  )

  show link: it => underline(
    stroke: (dash: "dashed"),
    offset: 0.2em,
  )[#it]

  show list: it => context {
    heading-gap.update(none)
    set text(size: 9pt)
    it
  }

  show list: set list(
    marker: [◦],
    spacing: 1em,
    body-indent: 0.5em,
  )

  show: doc => {
    set text(
      size: 9.5pt,
      lang: lang,
      font: font_configs.serif,
      fill: luma(20%),
    )
    doc
  }

  show heading: it => text(font: font_configs.sans, size: 12pt, weight: "black", it.body)
  show heading.where(level: 1): it => context {
    let previous = heading-gap.get()
    let reduction = if previous == none { 0pt } else { previous }
    heading-gap.update(0.2em)
    pad(top: -reduction, bottom: 0.6em, it)
  }
  show heading.where(level: 2): it => context {
    let previous = heading-gap.get()
    let reduction = if previous == none { 5pt } else { previous }
    heading-gap.update(0.1em)
    pad(top: -reduction, bottom: 0.3em, text(size: 10.5pt, weight: "bold", it.body))
  }

  set par(justify: true)

  show parbreak: it => context {
    heading-gap.update(none)
    it
  }

  set page(
    margin: (top: 1.25cm, bottom: 1.25cm, left: 1.5cm, right: 1.5cm),
    footer: [
      #align(center)[
        #text(
          size: 8pt,
          fill: luma(40%),
        )[*#en_name* -- Online version: #link("https://keyzh.pages.dev/cv")[`keyzh.pages.dev/cv`] Last Updated: #updated.display("[month repr:short] [year]") -- #context { counter(page).display("1 of 1", both: true) }]
      ]
    ],
  )

  align(center)[
    #block(text(size: 1.8em, weight: "bold", font: font_configs.serif, [#smallcaps(en_name) #h(0.4em) #{
      if ruby_name != none {
        text(size: 0.85em, weight: "black")[#ruby[#ruby_name][#original_name]]
      } else {
        text(
          original_name,
          size: 0.85em,
          weight: "black",
        )
      }
    }]))
  ]

  pad(
    top: 2pt,
    align(center)[
      #{
        let contact_info = contacts
        if address != none and address != "" {
          contact_info.push([#smallcaps(address)])
        }
        text(size: 9pt, contact_info.join("   "))
      }
    ],
  )

  body
}
