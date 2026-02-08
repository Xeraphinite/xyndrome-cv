#import "common.typ": reset-heading-gap

#let experience-entry(
  project: "",
  role: "",
  org: "",
  start: "",
  end: "",
  location: "",
  summary: none,
  details: [],
) = {
  reset-heading-gap()

  grid(
    columns: (1fr, auto),
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
  if summary != none [
    #strong(text(size: 0.85em, [#summary]))
    #v(0.2em)
  ]
  details
}

#let exp = experience-entry

#let service-entry(
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

#let ser = service-entry
