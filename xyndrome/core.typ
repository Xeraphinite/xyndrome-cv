/// Apply the cv layout to the document.
/// Sets up a header for the front page.
/// -> content

#let cv(
  /// The person's English name to be listed at the top of the CV. -> content
  en_name: "",
  /// The person's original name (e.g., Chinese, Japanese, Korean). -> content
  original_name: "",
  /// Your address, preferably in two-line format. -> str | content
  address: "",
  /// Contact info entries (use `contact(...)`). -> array(content)
  contacts: (),
  /// Date updated. -> datetime | str
  updated: datetime.today(),
  /// Language setting for the document. -> str
  lang: "en",
  /// The content of the cv. -> content
  body,
) = {
  // Metadata
  let full_name = if original_name != "" { en_name + "  " + original_name } else { en_name }
  set document(author: full_name, title: full_name, date: updated)

  // Multilingual serif font configuration (optimized for your system)
  let multilingual_fonts = (
    (name: "New Computer Modern", covers: "latin-in-cjk"),
    "Songti SC",            // Chinese serif
    "Hiragino Mincho ProN", // Japanese serif
    "AppleMyungjo",         // Korean serif
    "STSong",               // Chinese serif fallback
    "YuMincho",             // Japanese serif fallback
    "Georgia"               // English serif fallback
  )

  set text(
    size: 11pt,
    lang: lang,
    font: multilingual_fonts,
    fallback: true
  )
  
  set page(
    margin: (top: 1.25cm, bottom: 1.25cm, left: 1.5cm, right: 1.5cm),
    footer: [
      #align(center)[
        #en_name -- Last Updated: #updated.display() -- #context { counter(page).display("1 of 1", both: true) }
      ]
    ],
  )

  // Headings
  show heading: it => text(size: 12pt, it.body)
  show heading.where(level: 1): it => pad(bottom: 12pt, smallcaps(it))
  show heading.where(level: 2): it => pad(bottom: 0pt, it)

  // Author name display
  align(center)[
    #block(text(size: 14pt, weight: 700, [#smallcaps(full_name)]))
  ]

  // Contacts and Address (combined line)
  pad(
    top: 2pt,
    align(center)[
      #{
        let contact_info = contacts
        if address != none and address != "" {
          contact_info.push([#smallcaps(address)])
        }
        contact_info.join(" | ")
      }
    ],
  )

  // Main body
  set par(justify: true)
  body
}

/// Contact
#let contact(
  icon: none,
  label: "",
  url: "",
  height: 1em,
  baseline: 20%,
) = {
  let ico = if icon == none { [] } else { icon(height: height, baseline: baseline) }
  if url != "" { [#ico #h(0.1em) #link(url)[#label]] } else { [#ico #h(0.1em) #label] }
}

/// Create an education entry, suitable for one degree and accompanying information.
/// -> content
#let edu(
  institution: "",
  date: "",
  degrees: (),
  location: "",
  gpa: "",
  details: "",
) = {
  [#{
    for degree in degrees [
      #strong[#degree], #institution, #location #{
        if type(date) == datetime [
          #date.display("([month repr:long] [year])")
        ] else [
          (#date)
        ]
      }
      #{
        if gpa != "" [
          | GPA: #gpa
        ]
      }
      \
    ]
  }
  #{ if details != "" [#details] }]
}

/// Create an entry detailing work experience.
/// -> content
#let exp(
  project: "",
  role: "",
  org: "",
  start: "",
  end: "",
  location: "",
  details: [],
  output: none,
) = {
  [#grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#project]
        \ #role #h(1em) #org, #location
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
    #details
    #{
      if output != none [
        \ *Output:* #output
      ]
    }
  ]
}

/// Create an entry detailing service to the field.
/// -> content
#let ser(
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

/// Creates an entry for an award, such as a scholarship or fellowship.
/// -> content
#let award(
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

/// Skills section formatter.
/// -> content
#let skills(areas) = {
  for area in areas {
    strong[#area.at(0): ]
    area.at(1).join(" | ")
    linebreak()
  }
}

/// Simple skills section with categories  
/// -> content
#let simple_skills(
  /// Array of skill categories as tuples: (category_name, [skills_array])
  categories: (),
) = {
  for category in categories {
    grid(
      columns: (auto, 1fr),
      column-gutter: 2em,
      align(left)[*#category.at(0)*],
      align(right)[#category.at(1).join(", ")]
    )
  }
}