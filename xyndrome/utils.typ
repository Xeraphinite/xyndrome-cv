/// Utility functions for the Xyndrome CV template
/// This file contains helper functions and utilities used across components

#let render-icons = icons => {
  // Helper: render one or many icons with spacing
  if icons == none { [] } else if type(icons) == array {
    icons.filter(icon => icon != none).map(icon => box()[#icon]).join(h(0.5em))
  } else {
    box()[#icons]
  }
}

#let format-authors(authors) = {
  // Format authors with proper name handling and smallcaps
  if type(authors) == array {
    authors.map(author => {
      if type(author) == str {
        smallcaps(author)
      } else {
        smallcaps(author)
      }
    }).join(", ")
  } else {
    smallcaps(authors)
  }
}

#let short-name(full-name) = {
  // Convert "Jiewu Leng" to "J Leng" with smallcaps
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
  format: "full", // "full", "short", or "custom"
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

#let contact(
  // Contact
  icon: none,
  label: "",
  url: "",
  height: 0.9em, // Reduced slightly for better balance
  baseline: 15%, // Adjusted for better text alignment
) = {
  let ico = if icon == none { [] } else { icon(height: height, baseline: baseline) }
  if url != "" { [#ico #h(0.1em) #link(url)[#label]] } else { [#ico #h(0.1em) #label] }
}

#let link_with_icon(
  icon: none,
  url: "",
  text: "",
  height: 1em,
  baseline: 15%,
) = {
  let ico = if icon == none { [] } else { icon(height: height, baseline: baseline) }
  [#link(url)[#ico] #link(url)[#text]]
}

#let hide(should-hide, content) = {
  // Allows hiding or showing full resume dynamically using global variable. -> content
  if not should-hide { content }
}