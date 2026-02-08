#import "common.typ": reset-heading-gap
#import "../components/ui.typ": render-icon

#let project-entry(
  title: "",
  role: "",
  org: "",
  start: "",
  end: "",
  location: "",
  details: [],
  url: "",
  icon: none,
  icon-height: 0.95em,
  icon-baseline: 15%,
) = {
  reset-heading-gap()

  let project_title = if url != "" { link(url)[#title] } else { title }
  let icon-content = render-icon(icon, height: icon-height, baseline: icon-baseline)

  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    align(left)[
      #{
        if icon-content == none {
          [#strong[#project_title]]
        } else {
          [#icon-content #h(0.15em) #strong[#project_title]]
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

#let project = project-entry
