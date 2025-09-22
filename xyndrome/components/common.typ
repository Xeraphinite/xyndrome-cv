/// Shared state and helpers for the Xyndrome CV components.
#let heading-gap = state("heading-gap", none)

#let reset-heading-gap() = context {
  heading-gap.update(none)
  none
}