#import "../components/ui.typ": render-icon

#let artifact-entry(
  name: "",
  tech: (),
  description: "",
  url: "",
  icon: none,
  icon-height: 0.9em,
  icon-baseline: 15%,
  year: "",
) = {
  let icon-content = render-icon(icon, height: icon-height, baseline: icon-baseline)
  let tech-list = if tech == none {
    ()
  } else if type(tech) == array {
    tech
  } else if type(tech) == str {
    tech.split(",").map(item => item.trim()).filter(item => item != "")
  } else {
    (str(tech),)
  }
  let artifact_name = if icon-content == none {
    [#strong[#name]]
  } else {
    [#icon-content #h(0.15em) #strong[#name]]
  }

  grid(
    columns: (2fr, 5fr, 2fr, auto),
    column-gutter: 1em,
    align(left)[#artifact_name],
    align(left)[#text(size: 1em, style: "italic")[#description]],
    align(left)[#{ if tech-list.len() > 0 [#raw(tech-list.join(", "))] }],
    align(right)[#{ if year != "" [#year] }],
  )
}

#let artifact = artifact-entry
