#import "@preview/scienceicons:0.1.0": *

// Helper: render one or many icons with spacing
#let render-icons = (icons) => {
  if icons == none { [] }
  else if type(icons) == array {
    icons
      .filter(icon => icon != none)
      .map(icon => box()[#icon])
      .join(h(0.5em))
  } else {
    box()[#icons]
  }
}

/// Create a publications entry for a conference abstract.
/// -> content
#let abstract(
  /// List of authors in order. -> array | str
  authors: (),
  /// Title of the abstract. -> str | content
  title: "",
  /// Conference that the abstract was presented in/submitted to. -> str | content
  conference: "",
  /// (optional) Submission number for the abstract. -> str | int | content
  number: "",
  /// (optional) Page number in the abstract booklet. -> int | str | content | none
  pages: "",
  /// Date the abstract was presented. -> datetime | str
  date: "",
  /// Kind of presentation that the abstract was used for. -> str | content | none
  kind: "",
  /// Location of the conference. -> str | content | none
  location: "",
  /// (optional) Digital Object Identifier for the abstract. -> str | content | none
  DOI: none,
  /// (optional) One icon or a list of icons to display. -> content | array | none
  icons: none,
) = {
  let credit = (
    { if pages != "" [#pages,] else [] },
    { if kind != "" [ Abstract and #kind] else [ Abstract] },
    { if number != "" [ #number] },
  )
    .enumerate()
    .map(((i, cred)) => { if cred != none { [#cred] } else { none } })
    .join()

  enum.item[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #emph[#conference],
    #location\;
    #credit.
    #{
      if DOI != none [DOI: #link("https://doi.org/" + DOI)[#DOI]]
    }
    #{
      if icons != none [ #h(0.5em) #render-icons(icons) ]
    }
  ]
}

/// Create a publications entry for a peer-reviewed paper.
/// -> content
#let paper(
  /// List of authors in order. -> array | str
  authors: (),
  /// Title of the paper. -> str | content
  title: "",
  /// Journal that the paper was published in. -> str | content | none
  journal: none,
  /// Date of publication. -> datetime | str | content | none
  published: "",
  /// (optional) Volume of the journal. -> str | content | none
  vol: none,
  /// (optional) Issue of the journal. -> str | content | none
  issue: none,
  /// (optional) Page range of publication in journal. -> str | content | none
  pages: none,
  /// (optional) Digital Object Identifier for publication. -> str | content | none
  DOI: none,
  /// Whether or not to show the DOI -> bool
  show-link: true,
  /// (optional) One icon or a list of icons to display. -> content | array | none
  icons: none,
) = {
  // date formatting
  let date = {
    if type(published) == datetime {
      strong[#published.display("[year]")]
    } else if type(published) == content or type(published) == str {
      strong[#published]
    }
  }

  // flatten journal identifiers
  let credit = (
    { if journal != none { [#emph(journal) #date] } else { [#date] } },
    { if vol != none [, #vol#{ if issue != none [ (#issue)] }] },
    { if pages != none [, #pages] },
  )
    .enumerate()
    .map(((i, cred)) => { if cred != none { [#cred] } else { none } })
    .join()

  enum.item[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #credit.
    #{
      if DOI != none {
        if show-link { [DOI: #link("https://doi.org/" + DOI)[#DOI]] }
        else { [DOI: #DOI] }
      }
    }
    #{
      if icons != none [ #h(0.5em) #render-icons(icons) ]
    }
  ]
}

/// Create an entry detailing a preprinted (non-peer-reviewed) manuscript.
/// -> content
#let preprint(
  /// List of authors in order. -> array | str
  authors: (),
  /// Title of the manuscript. -> str | content
  title: "",
  /// Preprint archive that the manuscript was published in. -> str | content | none
  journal: "",
  /// Date of publication. -> datetime | str | content | none
  published: "",
  /// (optional) Status of the manuscript. -> str | none
  status: none,
  /// (optional) Digital Object Identifier for publication. -> str | content | none
  DOI: none,
  /// (optional) One icon or a list of icons to display. -> content | array | none
  icons: none,
) = {
  let date = {
    if type(published) == datetime {
      published.display("[month repr:long] [day], [year]")
    } else {
      published
    }
  }

  enum.item[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #emph[#status].
    Preprint available on #emph[#journal], #date.
    #{
      if DOI != none [DOI: #link("https://doi.org/" + DOI)[#DOI]]
    }
    #{
      if icons != none [ #h(0.5em) #render-icons(icons) ]
    }
  ]
}

/// Create an entry for a conference presentation.
/// -> content
#let pres(
  /// List of authors in order. -> array | str
  authors: (),
  /// Title of the abstract. -> str | content
  title: "",
  /// Conference that the abstract was presented in/submitted to. -> str | content
  conference: "",
  /// (optional) Submission number for the abstract. -> str | int | content
  number: "",
  /// (optional) Page number in the abstract booklet. -> int | str | content | none
  pages: "",
  /// Date the abstract was presented. -> datetime | str
  date: "",
  /// Kind of presentation that the abstract was used for. -> str | content | none
  kind: "",
  /// Location of the conference. -> str | content | none
  location: "",
  /// (optional) Digital Object Identifier for the abstract. -> str | content | none
  DOI: none,
  /// (optional) One icon or a list of icons to display. -> content | array | none
  icons: none,
) = {
  let credit = (
    { if pages != "" [#pages, ] },
    { if kind != "" [#kind] },
    { if number != "" [ #number] },
  )
    .enumerate()
    .map(((i, cred)) => { if cred != none [#cred] })
    .join()

  enum.item[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #emph[#conference],
    #location\;
    #credit.
    #{
      if DOI != none [DOI: #link("https://doi.org/" + DOI)[#DOI]]
    }
    #{
      if icons != none [ #h(0.5em) #render-icons(icons) ]
    }
  ]
}
