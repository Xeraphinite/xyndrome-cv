#import "common.typ": reset-heading-gap

#let skills-grid(
  categories: (),
) = {
  reset-heading-gap()

  for category in categories {
    grid(
      columns: (1fr, 4fr),
      column-gutter: 1em,
      align(left)[*#category.at(0)*],
      align(left)[#category.at(1).join(", ")],
    )
  }
}

#let skills = skills-grid