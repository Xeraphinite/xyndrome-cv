// Example icon package (use any you prefer)
#import "@preview/scienceicons:0.1.0": *
#import "icons.typ": openscad-icon, canton-tower-icon, location-icon

/// Create a link with an icon
/// -> content
#let link_with_icon(
  icon: none,
  url: "",
  text: "",
  height: 1em,
  baseline: 20%,
) = {
  let ico = if icon == none { [] } else { icon(height: height, baseline: baseline) }
  [#link(url)[#ico] #link(url)[#text]]
}

/// Create an info box for highlighting important information
/// -> content
#let info_box(
  /// The content to display. -> content
  content,
  /// Box type: "info", "warning", "success", "error". -> str
  type: "info",
) = {
  let colors = (
    info: (border: rgb("#3498db"), bg: rgb("#ebf3fd")),
    warning: (border: rgb("#f39c12"), bg: rgb("#fef9e7")),
    success: (border: rgb("#27ae60"), bg: rgb("#eafaf1")),
    error: (border: rgb("#e74c3c"), bg: rgb("#fdebea"))
  )
  
  let color_scheme = colors.at(type, default: colors.info)
  
  rect(
    width: 100%,
    stroke: (left: 3pt + color_scheme.border),
    fill: color_scheme.bg,
    inset: 10pt,
    radius: (right: 3pt)
  )[#content]
}

