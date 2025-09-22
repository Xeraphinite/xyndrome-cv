#import "common.typ": reset-heading-gap

#let experience-entry(
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