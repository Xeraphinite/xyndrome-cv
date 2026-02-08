/// Shared state and helpers for the Xyndrome CV components.
#let heading-gap = state("heading-gap", none)
#let heading-size-override = state("heading-size-override", none)
#let subheading-size-override = state("subheading-size-override", none)
#let list-size-override = state("list-size-override", none)

#let reset-heading-gap() = context {
  heading-gap.update(none)
  none
}

#let reset-typography-overrides() = context {
  heading-size-override.update(none)
  subheading-size-override.update(none)
  list-size-override.update(none)
  none
}
