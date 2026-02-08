/// Reusable UI components and icon/link helpers.

/// Global toggle for icon rendering.
#let icons-enabled = state("icons-enabled", true)

/// Render one icon from icon function or content.
#let render-icon(
  icon,
  height: 1em,
  baseline: 15%,
  right-space: 0pt,
) = {
  let enabled = context { icons-enabled.get() }
  if enabled == false or icon == none {
    none
  } else if type(icon) == function {
    icon(height: height, baseline: baseline, right-space: right-space)
  } else {
    let icon-box = box(height: height, baseline: baseline)[#icon]
    if right-space == 0pt { icon-box } else { box[#icon-box#h(right-space)] }
  }
}

/// Generic icon + content + link composer.
#let content-with-icon(
  content,
  icon: none,
  url: "",
  height: 1em,
  baseline: 15%,
  gap: 0.15em,
  right-space: 0pt,
  trailing: none,
) = {
  let rendered-icon = render-icon(icon, height: height, baseline: baseline, right-space: right-space)
  let main-content = if rendered-icon == none { content } else { [#rendered-icon#h(gap)#content] }
  let final-content = if trailing == none { main-content } else { [#main-content#h(gap)#trailing] }
  if url == "" { final-content } else { link(url)[#final-content] }
}

#let contact(
  icon: none,
  label: "",
  url: "",
  height: 0.9em,
  baseline: 15%,
  gap: 0.1em,
) = content-with-icon(
  label,
  icon: icon,
  url: url,
  height: height,
  baseline: baseline,
  gap: gap,
)

#let link-with-icon(
  icon: none,
  url: "",
  text: "",
  height: 1em,
  baseline: 15%,
  gap: 0.15em,
) = content-with-icon(
  text,
  icon: icon,
  url: url,
  height: height,
  baseline: baseline,
  gap: gap,
)

#let icon-with-link(
  icon: none,
  url: "",
  text: "",
  height: 1em,
  baseline: 15%,
  gap: 0.15em,
  trailing: none,
) = content-with-icon(
  text,
  icon: icon,
  url: url,
  height: height,
  baseline: baseline,
  gap: gap,
  trailing: trailing,
)

#let render-icons(
  icons,
  icon-gap: 0.5em,
  height: 1em,
  baseline: 15%,
) = {
  if icons == none {
    []
  } else if type(icons) == array {
    let rendered = icons
      .filter(icon => icon != none)
      .map(icon => render-icon(icon, height: height, baseline: baseline))
      .filter(icon => icon != none)
    if rendered.len() == 0 { [] } else { rendered.join(h(icon-gap)) }
  } else {
    let single = render-icon(icons, height: height, baseline: baseline)
    if single == none { [] } else { single }
  }
}

#let short-name(full-name) = {
  let parts = full-name.split(" ")
  if parts.len() >= 2 {
    let first-initial = parts.at(0).at(0).upper()
    let last-name = parts.at(-1)
    smallcaps([#first-initial #last-name])
  } else {
    smallcaps(full-name)
  }
}

#let authors-component(
  authors: (),
  format: "full",
  separator: ", ",
  custom-formatter: none,
) = {
  if type(authors) == array {
    let formatted = authors.map(author => {
      if format == "short" {
        short-name(author)
      } else if format == "custom" and custom-formatter != none {
        custom-formatter(author)
      } else {
        smallcaps(author)
      }
    })
    formatted.join(separator)
  } else {
    if format == "short" {
      short-name(authors)
    } else if format == "custom" and custom-formatter != none {
      custom-formatter(authors)
    } else {
      smallcaps(authors)
    }
  }
}

#let badge(
  label: "",
  icon: none,
  fill: luma(96%),
  stroke: luma(70%),
  text-color: luma(25%),
  radius: 0.25em,
  padding: (x: 0.4em, y: 0.4em),
  text-size: 0.9em,
  font: ("Inconsolata", "Consolas"),
  icon-height: 0.8em,
  icon-baseline: 15%,
  icon-gap: 0.1em,
) = {
  let badge-content = content-with-icon(
    label,
    icon: icon,
    height: icon-height,
    baseline: icon-baseline,
    gap: icon-gap,
  )
  box(
    stroke: stroke,
    fill: fill,
    inset: padding,
    radius: radius,
  )[
    #text(size: text-size, fill: text-color, weight: "medium", font: font)[#badge-content]
  ]
}

/// Alias used in TOML eval scope.
#let link_with_icon = link-with-icon
