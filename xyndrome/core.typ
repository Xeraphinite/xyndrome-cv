#import "utils.typ": *

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
      (name: "New Computer Modern Sans", covers: "latin-in-cjk"),
      "Arial",
      // CJK sans fallbacks (macOS / Windows)
      "PingFang SC",
      "Hiragino Sans",
      "Microsoft JhengHei",
    ),
    mono: (
      (name: "Cascadia Mono"),
      (name: "New Computer Modern Mono", covers: "latin-in-cjk"),
      // If you need CJK in code blocks, install and add a CJK mono font, e.g.:
      // "Sarasa Mono TC", "Sarasa Mono SC", "Noto Sans Mono CJK SC",
    ),
    math: "New Computer Modern Math",
  )

  show raw: it => text(font: font_configs.mono, it)

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

  show heading: it => text(font: font_configs.sans, size: 13pt, weight: "bold", it.body)
  show heading.where(level: 1): it => pad(bottom: 0.8em, smallcaps(it))

  set page(
    margin: (top: 1.25cm, bottom: 1.25cm, left: 1.5cm, right: 1.5cm),
    footer: [
      #align(center)[
        #text(
          size: 9pt,
          fill: luma(20%),
        )[*#en_name* -- Online version available at #link("https://keyzh.pages.dev/cv")[keyzh.pages.dev/cv], Updated: #updated.display("[month repr:short] [year]") -- #context { counter(page).display("1 of 1", both: true) }]
      ]
    ],
  )

  align(center)[
    #block(text(size: 1.8em, weight: "bold", font: font_configs.serif, [#smallcaps(en_name)  #original_name]))
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

// Publication type counters
#let journal-counter = counter("journal")
#let conference-counter = counter("conference") 
#let preprint-counter = counter("preprint")

#let edu(
  // Create an education entry, suitable for one degree and accompanying information. -> content
  institution: "",
  date: "",
  degree: "",
  details: "",
) = {
  grid(
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
  details
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
  grid(
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
  details
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
      columns: (1fr, auto),
      column-gutter: 1.5em,
      align(left)[#align()[*#category.at(0)*]], align(right)[#align(left)[#category.at(1).join(", ")]],
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
  icon-height: 0.95em, // Icon height for better text balance
  icon-baseline: 15%, // Icon baseline for better text alignment
) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 2em,
    align(left)[
      #{
        let project_title = if url != "" { link(url)[#title] } else { title }
        if icon != none {
          let icon_display = if type(icon) == function {
            icon(height: icon-height, baseline: icon-baseline)
          } else {
            box(height: icon-height, baseline: icon-baseline)[#icon]
          }
          [#icon_display #h(0.15em) #strong[#project_title]]
        } else {
          [#strong[#project_title]]
        }
        h(2em)
        // Technology stack - styled globally via raw text
        if tech.len() > 0 [ #text(size: 1em)[#raw(tech.join(", "))]]
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

// Publication type counters
#let journal-counter = counter("journal")
#let conference-counter = counter("conference") 
#let preprint-counter = counter("preprint")

#let paper(
  authors: (), // List of authors in order. -> array | str
  title: "",     // Title of the publication. -> str | content
  venue: "",      // publication venue (e.g., CVPR, NeurIPS, ArXiv, etc.). -> str | content
  published: "", // status and date of publication/presentation.
  metadata: "", // other metadata (e.g., VOL, JCR, etc.)
  DOI: none,   // (optional) Digital Object Identifier. -> str | content | none
  icon: none, // (optional) One icon or a list of icons to display. -> content | array | none
  tldr: none, // (optional) Too Long; Didn't Read summary. -> str | content | none
  type: "journal", // Type of publication: "journal", "conference", or "preprint"
) = {
  let author_text = authors-component(authors: authors, format: "full")
  
  // Get the appropriate counter and prefix based on type
  let (pub_counter, prefix) = if type == "journal" {
    (journal-counter, "J")
  } else if type == "conference" {
    (conference-counter, "C") 
  } else if type == "preprint" {
    (preprint-counter, "P")
  } else {
    (journal-counter, "J") // default fallback
  }
  
  // Step the counter and get current value
  pub_counter.step()
  let number = context pub_counter.display()

  enum.item[
    \[#prefix#number\] #{ author_text }. (#{ published.split(",").at(-1).trim() }). #{ emph(title) }.  _#{ venue }_#{ if metadata != "" [. #{ metadata }] }.
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
  // Create a patent entry with consistent formatting. -> content
  number: "", // Patent number. -> str
  title: "", // Title of the patent. -> str | content
  inventors: (), // List of inventors in order. -> array | str
  filed: "", // Filing date. -> str
  status: "", // Status of the patent (e.g., "Application", "Granted"). -> str
  country: "", // Country code (e.g., "CN", "US"). -> str
  icon: none, // (optional) One icon or a list of icons to display. -> content | array | none
) = {
  let inventor_text = authors-component(authors: inventors, format: "full")

  // Parse filing date to get year
  let year = filed.split("-").at(0)

  enum.item[
    #inventor_text (#year). #emph(title) \[#status\]. #country Patent \##number.
    #{ if icon != none [ #h(0.5em) #if type(icon) == array { icon.join(h(0.5em)) } else { icon }] }
  ]
}

#let copyright(
  // Create a copyright entry with consistent formatting. -> content
  title: "", // Title of the copyrighted work. -> str | content
  year: "", // Year of copyright. -> str
  status: "", // Status of the copyright. -> str,
  country: "", // Country of copyright. -> str
  holders: (), // Copyright holders. -> array | str
  icon: none, // (optional) One icon or a list of icons to display. -> content | array | none
) = {
  let holder_text = authors-component(authors: holders, format: "full")
  
  enum.item[
    #holder_text (#year). #emph(title). #status, #country.
    #{ if icon != none [ #h(0.5em) #if type(icon) == array { icon.join(h(0.5em)) } else { icon }] }
  ]
}

#let artifact(
  // Create an artifact entry - a one-line item with optional icon, name, tech stack, description, and time. -> content
  name: "",
  tech: (), // Technology stack. -> array
  description: "",
  time: "",
  icon: none, // (optional) Icon to display. -> content | none
  icon-height: 0.9em, // Icon height for better text balance
  icon-baseline: 15%, // Icon baseline for better text alignment
) = {
  grid(
    columns: (auto, 1fr, auto),
    column-gutter: 1em,
    align(left)[
      #{
        let artifact_name = if icon != none {
          let icon_display = if type(icon) == function {
            icon(height: icon-height, baseline: icon-baseline)
          } else {
            box(height: icon-height, baseline: icon-baseline)[#icon]
          }
          [#icon_display #h(0.15em) #strong[#name]]
        } else {
          [#strong[#name]]
        }
        artifact_name
      }
      #{
        if tech.len() > 0 [ #h(0.5em) #text(size: 0.9em)[#raw(tech.join(", "))]]
      }
    ],
    align(left)[
      #text(size: 0.9em, style: "italic")[#description]
    ],
    align(right)[
      #text(size: 0.9em, fill: luma(40%))[#time]
    ],
  )
}
