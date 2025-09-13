/// Apply the cv layout to the document.
/// Sets up a header for the front page.
/// -> content

// Put this near the top of your document

#let cv(
  /// The person to be listed at the top of the CV. -> content
  author: "",
  original: "",
  /// Your address, preferably in two-line format. -> str | content
  address: "",
  /// Contact info entries (use `contact(...)`). -> array(content)
  contacts: (),
  /// Date updated. -> datetime | str
  updated: datetime.today(),
  /// The content of the cv. -> content
  body,
) = {
  // Metadata
  set document(author: author, title: author, date: updated)

  // Global text & page
  set text(size: 11pt, lang: "en")
  set page(
    margin: (top: 1.25cm, bottom: 1.25cm, left: 1.5cm, right: 1.5cm),
    footer: [
      #align(center)[
        #author -- CV -- #context { counter(page).display("1 of 1", both: true) }
      ]
    ],
  )

  // Headings
  show heading: it => text(size: 12pt, it.body)
  show heading.where(level: 1): it => pad(bottom: 12pt, smallcaps(it))
  show heading.where(level: 2): it => pad(bottom: 0pt, it)

  // Author
  align(center)[
    #block(text(size: 14pt, weight: 700, [#smallcaps(author)]))
  ]

  // Contacts (with icons)
  pad(
    top: 2pt,
    align(center)[
      #contacts.join("  |  ")
    ],
  )

  // Address (if provided)
  if address != none and address != "" {
    align(center)[
      #smallcaps[#address]
    ]
  }

  // Main body
  set par(justify: true)
  body
}

/// Contact helper: icon + text (+ optional link)
/// Contact helper: icon + text (+ optional link)
/// Contact helper: icon + text (+ optional link)
#let contact(
  /// Icon function from @preview/scienceicons. -> function | none
  icon: none,
  /// Visible label. -> str | content
  label: "",
  /// Optional URL (mailto:, https://, etc.). -> str | none
  url: "",
  /// Icon height. -> length
  height: 1em,
  /// Icon baseline shift. -> ratio
  baseline: 20%,
) = {
  let ico = if icon == none { [] } else { icon(height: height, baseline: baseline) }
  if url != "" { [#ico #h(0.35em) #link(url)[#label]] } else { [#ico #h(0.35em) #label] }
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
  [#grid(
      columns: (auto, 1fr),
      align(left)[
        #{
          for degree in degrees [
            #strong[#degree] \
          ]
        }
        #institution
        \ #{
          if gpa != "" [
            GPA: #gpa
          ]
        }
      ],
      align(right)[
        #{ if location != "" { location } }
        #{
          if type(date) == datetime [
            \ #date.display("[month repr:long] [year]")
          ] else [
            \ #date
          ]
        }
      ],
    )
    #{ if details != "" [#details] }
  ]
}

/// Create an entry detailing work experience.
/// -> content
#let exp(
  role: "",
  org: "",
  start: "",
  end: "",
  location: "",
  summary: "",
  details: [],
) = {
  [#grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#role]
        \ #org
        #{
          if summary != "" [
            \ #summary
          ]
        }
      ],
      align(right)[
        #{
          if location != "" [
            #location
          ]
        }
        #text[
          \ #{
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
    ) #details]
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
    columns: (8em, auto, 3em),
    align(left)[
      #{ if type(date) == datetime [#date.display("[year]")] else [#date] }
    ],
    align(left)[
      #strong[#name,] #text[#from. #details]
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
