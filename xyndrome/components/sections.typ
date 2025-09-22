/// Section heading helper that preserves the existing typography style.
/// Usage: `#sec-heading(icon: education-icon, title: "Education")`
#let sec-heading(
  title: "",
  icon: none,
  level: 1,
  icon-height: 1.05em,
  icon-baseline: 15%,
  gap: 0.35em,
  subtitle: none,
  subtitle-gap: 0.5em,
) = {
  let icon-content = if icon == none {
    none
  } else if type(icon) == function {
    icon(height: icon-height, baseline: icon-baseline)
  } else {
    box(height: icon-height, baseline: icon-baseline)[#icon]
  }

  let heading-body = if icon-content == none {
    [#title]
  } else {
    [#icon-content #h(gap) #title]
  }

  let heading-block = if subtitle == none {
    heading-body
  } else {
    [#heading-body #h(subtitle-gap) #text(size: 10.5pt, weight: "medium")[#subtitle]]
  }

  heading(level: level)[#heading-block]
}