#let cv( // Apply the cv layout to the document. Sets up a header for the front page. -> content
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

  let font_configs = (
    (name: "New Computer Modern", covers: "latin-in-cjk"),
    (name: "Cascadia Mono", covers: "latin-in-cjk"),
    "Songti SC", // Fallbacks Font for MacOS
    "Hiragino Mincho ProN", 
    "AppleMyungjo",
    "STSong",
    "YuMincho",
    "Georgia",
  )

  set text(
    size: 10pt,
    lang: lang,
    font: font_configs,
    fallback: true,
  )

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

  show heading: it => text(size: 13pt, it.body) // Headings
  show heading.where(level: 1): it => pad(bottom: 6pt, smallcaps(it))
  show heading.where(level: 2): it => pad(bottom: 10pt, it)

  align(center)[ // Author name display
    #block(text(size: 16pt, weight: "bold", [#smallcaps(en_name)  #original_name]))
  ]

  pad( // Contacts and Address (combined line)
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

#let contact( // Contact
  icon: none,
  label: "",
  url: "",
  height: 1em,
  baseline: 20%,
) = {
  let ico = if icon == none { [] } else { icon(height: height, baseline: baseline) }
  if url != "" { [#ico #h(0.1em) #link(url)[#label]] } else { [#ico #h(0.1em) #label] }
}

#let edu( // Create an education entry, suitable for one degree and accompanying information. -> content
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
      ]
    )
    #details
  ]
}

#let exp( // Create an entry detailing work experience. -> content
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

#let ser( // Create an entry detailing service to the field. -> content
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

#let award( // Creates an entry for an award, such as a scholarship or fellowship. -> content
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

#let skills( // Skills section formatter. -> content
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

#let project( // Create a project entry. -> content
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
        // TODO: need to updated to support icons, and monospace font
        if tech.len() > 0 [ #text(size: 0.75em, style: "italic")[#tech.join(", ")]] 
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

#let hide(should-hide, content) = { // Allows hiding or showing full resume dynamically using global variable. -> content
  if not should-hide { content }
}

#let render-icons = (icons) => { // Helper: render one or many icons with spacing
  if icons == none { [] }
  else if type(icons) == array {
    icons
      .filter(icon => icon != none)
      .map(icon => box()[#icon])
      .join(h(0.5em))
  } else {
    box()[#icons]
  }
}

#let paper( // Create a unified publication entry that handles different types of publications. -> content
  authors: (), // List of authors in order. -> array | str
  title: "", // Title of the publication. -> str | content
  from: "", // publication name
  published: "", // status and date of publication/presentation. 
  metadata: "", // other metadata (e.g., VOL, JCR, etc.)
  DOI: none, // (optional) Digital Object Identifier. -> str | content | none
  icon: none, // (optional) One icon or a list of icons to display. -> content | array | none
  tldr: none, // (optional) Too Long; Didn't Read summary. -> str | content | none
) = {
  let author_text = if type(authors) == array { // Format authors
    authors.join(", ")
  } else { authors }

  enum.item[
    #{author_text}. #{title}.  #{published}#{if metadata != "" [. #{metadata}]}.
    #{if DOI != none [DOI: #link("https://doi.org/" + DOI)[#DOI]]}
    #{if icon != none [ #h(0.5em) #if type(icon) == array { icon.join(h(0.5em)) } else { icon }]}
    #{if tldr != none [ 
      #v(0.2em)
      #text(style: "italic", size: 0.9em, fill: rgb("#555555"))[*TL;DR:* #tldr]
    ]}
  ]
}
