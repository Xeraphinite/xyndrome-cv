/// Allows hiding or showing full resume dynamically using global variable.
/// -> content
#let hide(should-hide, content) = {
  if not should-hide { content }
}

/// Create an entry documenting a research project.
/// -> content
#let proj(
  title: "",
  advisors: (),
  institution: "",
  start: "",
  end: "",
  time: "",
  access: [],
  significance: [],
  skills: [],
) = {
  pagebreak()

  heading(title)
  grid(columns: (1fr, auto))

  strong[Access.]
  [#access]

  strong[Significance.]
  [#significance]

  strong[Skills.]
  [#skills]
}
