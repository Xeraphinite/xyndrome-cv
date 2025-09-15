#let cv(
  // Apply the cv layout to the document. Sets up a header for the front page. -> content
  en_name: "", // The person's English name to be listed at the top of the CV. -> content
  original_name: "", // The person's original name (e.g., Chinese, Japanese, Korean). -> content
  address: "", // Your address, preferably in two-line format. -> str | content
  contacts: (), // Contact info entries (use `contact(...)`). -> array(content)
  updated: datetime.today(), // Date updated. -> datetime | str
  lang: "en", // Language setting for the document. -> str
  body, // The content of the cv. -> content
) = {
  let full_name = if original_name != "" { en_name + "  " + original_name } else { en_name }
  set document(author: full_name, title: full_name, date: updated)

  // Harmonized stacks built around your choices
  let font_configs = (
    serif: (
      (name: "New Computer Modern", covers: "latin-in-cjk"),
      "Georgia",
      "Songti SC",
      "Hiragino Mincho ProN",
      "AppleMyungjo",
      "STSong",
      "YuMincho",
    ),
    sans: (
      (name: "New Computer Modern Sans", covers: "latin-in-cjk", ),
      "Arial",
      // CJK sans fallbacks (macOS / Windows)
      "PingFang SC",
      "Hiragino Sans",
      "Microsoft JhengHei",
    ),
    mono: (
      (name: "Cascadia Mono", covers: "latin-in-cjk"),
      (name: "New Computer Modern Mono", covers: "latin-in-cjk"),
      // If you need CJK in code blocks, install and add a CJK mono font, e.g.:
      // "Sarasa Mono TC", "Sarasa Mono SC", "Noto Sans Mono CJK SC",
    ),
    math: "New Computer Modern Math",
  )

  // Global defaults (sans body, serif headings, mono for code, NCM math)
  show: doc => {
    set text(
      size: 10pt,
      lang: lang,
      font: font_configs.serif,
      fallback: true,
      cjk-latin-spacing: auto,
    )

    doc
  }

  show heading: it => text(font: font_configs.sans, size: 13pt, it.body)
  show heading.where(level: 1): it => pad(bottom: 6pt, smallcaps(it))
  show heading.where(level: 2): it => pad(bottom: 10pt, it)

  set page(
    margin: (top: 1.25cm, bottom: 1.25cm, left: 1.5cm, right: 1.5cm),
    footer: [
      #align(center)[
        #text(
          size: 9pt,
          fill: luma(20%),
        )[#en_name -- Updated: #updated.display("[month repr:short] [year]") -- #context { counter(page).display("1 of 1", both: true) }]
      ]
    ],
  )

  

  // Code and monospace text styling
  show raw: it => text(font: font_configs.mono, it)

  align(center)[ // Author name display
    #block(text(size: 16pt, weight: "bold", font: font_configs.sans, [#smallcaps(en_name)  #original_name]))
  ]

  pad(
    // Contacts and Address (combined line)
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

  set par(justify: true)
  body
}

#let contact(
  // Contact
  icon: none,
  label: "",
  url: "",
  height: 1em,
  baseline: 20%,
) = {
  let ico = if icon == none { [] } else { icon(height: height, baseline: baseline) }
  if url != "" { [#ico #h(0.1em) #link(url)[#label]] } else { [#ico #h(0.1em) #label] }
}

#let edu(
  // Create an education entry, suitable for one degree and accompanying information. -> content
  institution: "",
  date: "",
  degree: "",
  details: "",
) = {
  [#grid(
      columns: (1fr, auto),
      column-gutter: 2em,
      align(left)[
        #strong[#degree], #institution
      ],
      align(right)[
        #{
          if type(date) == datetime [
            #date.display("[month repr:long] [year]")
          ] else [
            #date
          ]
        }
      ],
    )
    #details
  ]
}

#let exp(
  // Create an entry detailing work experience. -> content
  project: "",
  role: "",
  org: "",
  start: "",
  end: "",
  location: "",
  details: [],
) = {
  [#grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#project]
        \ #text(size: 0.9em, [#role])
      ],
      align(right)[
        #text[
          #{
            if type(start) == datetime {
              start.display("[month repr:long] [year]")
            } else { start }
          } #{
            if end != "" [
              #{
                if type(end) == datetime {
                  end.display("- [month repr:long] [year]")
                } else [\- #end \ #text(size: 0.9em, [#org `@` #location])]
              }
            ]
          }]
      ],
    )
    #details
  ]
}

#let ser(
  // Create an entry detailing service to the field. -> content
  role: "",
  org: "",
  start: "",
  end: "",
  summary: none,
) = {
  grid(
    columns: (auto, 1fr),
    align(left)[
      #org, #strong[#role]
      #{
        if summary != none [
          \ #summary
        ]
      }
    ],
    align(right)[
      #text[
        #{
          if type(start) == datetime {
            start.display("[month repr:long] [year]")
          } else { start }
        } #{
          if end != "" [
            #{
              if type(end) == datetime {
                end.display("- [month repr:long] [year]")
              } else [\- #end]
            }
          ]
        }]
    ],
  )
}

#let award(
  // Creates an entry for an award, such as a scholarship or fellowship. -> content
  name: "",
  date: "",
  from: "",
  amt: "",
  details: "",
) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    align(left)[
      #strong[#name,] #text[#from. #details]
    ],
    align(right)[
      #{ if type(date) == datetime [#date.display("[year]")] else [#date] }
    ],
  )
}

#let skills(
  // Skills section formatter. -> content
  categories: (), // Array of skill categories as tuples: (category_name, [skills_array])
) = {
  for category in categories {
    grid(
      columns: (auto, 1fr),
      column-gutter: 2em,
      align(left)[*#category.at(0)*], align(right)[#category.at(1).join(", ")],
    )
  }
}

#let project(
  // Create a project entry. -> content
  title: "",
  role: "",
  org: "",
  start: "",
  end: "",
  location: "",
  details: [],
  tech: (),
  url: "",
  icon: none, // (optional) Icon to display at the front of project name. -> content | none
) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 2em,
    align(left)[
      #{
        let project_title = if url != "" { link(url)[#title] } else { title }
        if icon != none {
          [#icon #h(0.2em) #strong[#project_title]]
        } else {
          [#strong[#project_title]]
        }
        h(2em)
        // Technology stack - styled globally via raw text
        if tech.len() > 0 [ #text(size: 0.75em)[#raw(tech.join(", "))]]
      }
      #if role != "" [ \ #text(size: 0.9em, [#role]) ]

    ],
    align(right)[
      #if org != "" [#org]
      #if location != "" and org != "" [, #location] else if location != "" [#location]
      \
      #{
        if type(start) == datetime {
          text(size: 0.9em, [#start.display("[month repr:long] [year]")])
        } else { text(size: 0.9em, [#start]) }
      } #{
        if end != "" [
          #{
            if type(end) == datetime {
              text(size: 0.9em, [#end.display("- [month repr:long] [year]")])
            } else [\- #text(size: 0.9em, [#end])]
          }
        ]
      }
    ],
  )
  details
}

#let hide(should-hide, content) = {
  // Allows hiding or showing full resume dynamically using global variable. -> content
  if not should-hide { content }
}

#let render-icons = icons => {
  // Helper: render one or many icons with spacing
  if icons == none { [] } else if type(icons) == array {
    icons.filter(icon => icon != none).map(icon => box()[#icon]).join(h(0.5em))
  } else {
    box()[#icons]
  }
}

#let paper(
  // Create a unified publication entry that handles different types of publications. -> content
  authors: (), // List of authors in order. -> array | str
  title: "", // Title of the publication. -> str | content
  from: "", // publication name
  published: "", // status and date of publication/presentation.
  metadata: "", // other metadata (e.g., VOL, JCR, etc.)
  DOI: none, // (optional) Digital Object Identifier. -> str | content | none
  icon: none, // (optional) One icon or a list of icons to display. -> content | array | none
  tldr: none, // (optional) Too Long; Didn't Read summary. -> str | content | none
) = {
  let author_text = if type(authors) == array {
    // Format authors
    authors.join(", ")
  } else { authors }

  enum.item[
    #{ author_text }. #{ title }.  #{ published }#{ if metadata != "" [. #{ metadata }] }.
    #{ if DOI != none [DOI: #link("https://doi.org/" + DOI)[#DOI]] }
    #{ if icon != none [ #h(0.5em) #if type(icon) == array { icon.join(h(0.5em)) } else { icon }] }
    #{
      if tldr != none [
        #v(0.2em)
        #text(style: "italic", size: 0.9em, fill: rgb("#555555"))[*TL;DR:* #tldr]
      ]
    }
  ]
}

#let patent(
  // Create a patent entry. -> content
  number: "", // Patent number. -> str
  title: "", // Title of the patent. -> str | content
  inventors: (), // List of inventors in order. -> array | str
  filed: "", // Filing date. -> str
  status: "", // Status of the patent (e.g., "Application", "Granted"). -> str
  country: "", // Country code (e.g., "CN", "US"). -> str
) = {
  let inventor_text = if type(inventors) == array {
    inventors.join(", ")
  } else { inventors }

  enum.item[
    *#number* — #title
    \ *Inventors:* #inventor_text; *Filed:* #filed; *Status:* #status.
  ]
}

#let copyright(
  // Create a copyright entry. -> content
  title: "", // Title of the copyrighted work. -> str | content
  status: "", // Status of the copyright. -> str
) = {
  enum.item[
    #title — #status.
  ]
}

#let link_with_icon(
  icon: none,
  url: "",
  text: "",
  height: 1em,
  baseline: 20%,
) = {
  let ico = if icon == none { [] } else { icon(height: height, baseline: baseline) }
  [#link(url)[#ico] #link(url)[#text]]
}