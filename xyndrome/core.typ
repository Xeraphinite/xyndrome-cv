#import "utils.typ": *
#import "icons.typ": *

#let heading-gap = state("heading-gap", none)
#let reset-heading-gap() = context {
  heading-gap.update(none)
  none
}

#let cv(
  en_name: "",               // The person's English name to be listed at the top of the CV. -> content
  original_name: "",         // The person's original name (e.g., Chinese, Japanese, Korean). -> content
  address: "",               // Your address, preferably in two-line format. -> str | content
  contacts: (),              // Contact info entries (use `contact(...)`). -> array(content)
  updated: datetime.today(), // Date updated. -> datetime | str
  lang: "en",                // Language setting for the document. -> str
  body,                      // The content of the cv. -> content
) = {
  let full_name = if original_name != "" { en_name + "  " + original_name } else { en_name }
  set document(author: full_name, title: full_name, date: updated)

  let font_configs = (
    serif: (
      (name: "Spectral", covers: "latin-in-cjk"),
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
    // fill: luma(240),
    // radius: 0.2em,
    text(font: font_configs.mono, weight: 500, it, size: 1.2em)
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
    spacing: 9pt,
  )

  show: doc => {
    set text(
      size: 9.5pt,
      lang: lang,
      font: font_configs.serif,
      fill: luma(20%)
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

  set par(justify: true);

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
        )[*#en_name* -- Online version available at #link("https://keyzh.pages.dev/cv")[keyzh.pages.dev/cv], Updated: #updated.display("[month repr:short] [year]") -- #context { counter(page).display("1 of 1", both: true) }]
      ]
    ],
  )

  align(center)[
    #block(text(size: 1.8em, weight: "bold", font: font_configs.serif, [#smallcaps(en_name) #original_name]))
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

  reset-heading-gap()

  body
}

#let edu(
  // Create an education entry, suitable for one degree and accompanying information. -> content
  institution: "",
  date: "",
  degree: "",
  details: "",
) = {
  reset-heading-gap()

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
  reset-heading-gap()

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
  reset-heading-gap()

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
  name: "",
  date: "",
  from: "",
  details: "",
) = {
  reset-heading-gap()

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
  categories: (), // Array of skill categories as tuples: (category_name, [skills_array])
) = {
  reset-heading-gap()

  for category in categories {
    grid(
      columns: (1fr, 3fr),
      column-gutter: 1em,
      align(left)[*#category.at(0)*],
      align(left)[#category.at(1).join(", ")],
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
  url: "",
  icon: none, // (optional) Icon to display at the front of project name. -> content | none
  icon-height: 0.95em, // Icon height for better text balance
  icon-baseline: 15%, // Icon baseline for better text alignment
) = {
  reset-heading-gap()

  let has_url = url != ""
  let columns = (1fr, auto)
  
  grid(
    columns: columns,
    column-gutter: 1em,
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
      }
      #{
        if role != "" [ \ #text(size: 0.9em, [#role]) ]
      }
    ],
    align(right)[
      #{
        if org != "" [#org]
        if location != "" and org != "" [, #location] else if location != "" [#location]
        if start != "" or end != "" [
          \ #{
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
#let patent-counter = counter("patent")
#let software-counter = counter("software")

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
  pdf: none, // (optional) Link to PDF version of the paper. -> str | content | none
) = {
  reset-heading-gap()

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

  pad(
    bottom: 0.6em,
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      align(top)[#text(weight: "bold")[\[#prefix#number\]]],
      align(left)[
        #{ author_text }. (#{ published.split(",").at(-1).trim() }). #{ emph(title) }. _#{ venue }_#{ if metadata != "" [. #{ metadata }] }.
        #{ if DOI != none [DOI: #link("https://doi.org/" + DOI)[#DOI]] }
        #{ if pdf != none [#h(0.5em) #link_with_icon(icon: pdf-icon, url: pdf, text: `PDF`)] }
        #{ if icon != none [
          #h(0.5em)
          #if type(icon) == array { icon.join(h(0.5em)) } else { icon }
        ] }
        #{ if tldr != none [
          #v(0.2em)
          #text(style: "italic", size: 0.9em, fill: rgb("#555555"))[*TL;DR:* #tldr]
        ] }
      ],
    ),
  )
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
  reset-heading-gap()

  let inventor_text = authors-component(authors: inventors, format: "full")

  // Parse filing date to get year
  let year = filed.split("-").at(0)

  patent-counter.step()
  let pat_number = context patent-counter.display()

  pad(
    bottom: 0.1em,
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      align(top)[#text(weight: "bold")[\[P#{pat_number}\]]],
      align(left)[
        #inventor_text (#year). #emph(title) \[#{status}\]. #country #{number}.
        #{ if icon != none [
          #h(0.5em)
          #if type(icon) == array { icon.join(h(0.5em)) } else { icon }
        ] }
      ],
    ),
  )
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
  reset-heading-gap()

  let holder_text = authors-component(authors: holders, format: "full")

  software-counter.step()
  let number = context software-counter.display()

  pad(
    bottom: 0.1em,
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      align(top)[#text(weight: "bold")[\[S#number\]]],
      align(left)[
        #holder_text (#year). #emph(title). #status, #country.
        #{ if icon != none [
          #h(0.5em)
          #if type(icon) == array { icon.join(h(0.5em)) } else { icon }
        ] }
      ],
    ),
  )
}

#let artifact(
  // Create an artifact entry - a one-line item with optional icon, name, tech stack, description, and time. -> content
  name: "",
  tech: (), // Technology stack. -> array
  description: "",
  url: "", // Optional URL for the artifact
  icon: none, // (optional) Icon to display. -> content | none
  icon-height: 0.9em, // Icon height for better text balance
  icon-baseline: 15%, // Icon baseline for better text alignment
  year: "", // Year of creation or release. -> str
) = {
  reset-heading-gap()
  
  // Determine if we need URL column
  let has_url = url != ""
  let columns = (1fr, 1fr, 3fr, auto)
  
  grid(
    columns: columns,
    column-gutter: 1em,
    // Name column
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
    ],
    // Tech stack column
    align(left)[#{
        if tech.len() > 0 [#raw(tech.join(", "))]
      }],
    // Description column
    align(left)[#text(size: 1em, style: "italic")[#description]],
    // Year/URL column
    align(right)[
      #{
        if year != "" [#year]
      }
    ]
  )
}

