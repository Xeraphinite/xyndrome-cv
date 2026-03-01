#import "index.typ": *
#import "../icons.typ": *
#import "../components/ui.typ": contact, badge
#import "../utils.typ": bullet-list, format-people, has-text, opt-text, rich

#let icon-map = (
  email: email-icon,
  website: website-icon,
  github: github-icon,
  location: location-icon,
  phone: phone-icon,
  spada: spada-icon,
)

#let icon-for(name) = if name == none or name == "" { none } else { icon-map.at(name, default: none) }

#let render-education(section) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str { (institution: item, degree: "", date: "", details: ()) } else { item }
      edu(
        institution: entry.at("institution", default: ""),
        degree: entry.at("degree", default: ""),
        date: entry.at("date", default: ""),
        details: bullet-list(entry.at("details", default: ())),
      )
    }
  }
}

#let render-experience(section) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str { (project: item, stack: none, role: "", org: "", location: "", start: "", end: "", details: ()) } else { item }
      exp(
        project: entry.at("project", default: ""),
        stack: entry.at("stack", default: none),
        role: entry.at("role", default: ""),
        org: entry.at("org", default: ""),
        location: entry.at("location", default: ""),
        start: entry.at("start", default: ""),
        end: entry.at("end", default: ""),
        summary: entry.at("summary", default: none),
        details: bullet-list(entry.at("details", default: ())),
      )
    }
  }
}

#let render-publications(section, aliases) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str {
        (type: "journal", authors: (), title: item, venue: "", published: "", metadata: "", DOI: none, tldr: none, pdf: none)
      } else { item }
      paper(
        type: entry.at("type", default: "journal"),
        authors: format-people(entry.at("authors", default: ()), aliases: aliases),
        title: entry.at("title", default: ""),
        venue: entry.at("venue", default: ""),
        published: entry.at("published", default: ""),
        metadata: entry.at("metadata", default: ""),
        DOI: opt-text(entry.at("DOI", default: none)),
        tldr: opt-text(entry.at("tldr", default: none)),
        pdf: opt-text(entry.at("pdf", default: none)),
      )
    }
  }
}

#let render-patents(section, aliases) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str {
        (number: "", title: item, inventors: (), filed: "", status: "", country: "")
      } else { item }
      patent(
        number: entry.at("number", default: ""),
        title: entry.at("title", default: ""),
        inventors: format-people(entry.at("inventors", default: ()), aliases: aliases),
        filed: entry.at("filed", default: ""),
        status: entry.at("status", default: ""),
        country: entry.at("country", default: ""),
      )
    }
  }
}

#let render-copyrights(section, aliases) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str {
        (title: item, year: "", status: "", country: "", holders: ())
      } else { item }
      copyright(
        title: entry.at("title", default: ""),
        year: entry.at("year", default: ""),
        status: entry.at("status", default: ""),
        country: entry.at("country", default: ""),
        holders: format-people(entry.at("holders", default: ()), aliases: aliases),
      )
    }
  }
}

#let render-projects(section) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str {
        (title: item, url: "", role: "", org: "", start: "", end: "", location: "", icon: "", details: ())
      } else { item }
      project(
        title: entry.at("title", default: ""),
        stack: entry.at("stack", default: none),
        url: entry.at("url", default: ""),
        role: entry.at("role", default: ""),
        org: entry.at("org", default: ""),
        start: entry.at("start", default: ""),
        end: entry.at("end", default: ""),
        location: entry.at("location", default: ""),
        summary: entry.at("summary", default: none),
        icon: icon-for(entry.at("icon", default: "")),
        details: bullet-list(entry.at("details", default: ())),
      )
    }
  }
}

#let render-skill-item(item) = {
  if type(item) == dictionary {
    let text = item.at("text", default: item.at("name", default: none))
    let category = item.at("category", default: item.at("badge", default: none))
    let content = rich(text)
    if content == none { none }
    else if category == none or category == "" { content }
    else {
      [
        #content #h(0.18em)
        #badge(
          label: category,
          text-size: 0.62em,
          padding: (x: 0.22em, y: 0.14em),
          radius: 0.18em,
          fill: luma(95%),
          stroke: luma(72%),
        )
      ]
    }
  } else {
    rich(item)
  }
}

#let render-skills(section) = {
  if section != none {
    let categories = section.pairs().map(pair => {
      let key = pair.at(0)
      let raw-entry = pair.at(1)
      let entry = if type(raw-entry) == dictionary {
        raw-entry
      } else {
        (label: key, items: (raw-entry,))
      }
      let label = if entry.at("label", default: none) != none and entry.at("label") != "" { entry.at("label") } else { key }
      let items = entry.at("items", default: ()).map(item => render-skill-item(item)).filter(item => item != none)
      (label, items)
    })
    skills(categories: categories)
  }
}

#let render-artifacts(section) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str {
        (name: item, tech: (), description: "", year: "", url: "", icon: "")
      } else { item }
      artifact(
        name: entry.at("name", default: ""),
        tech: entry.at("tech", default: ()),
        description: entry.at("description", default: ""),
        year: entry.at("year", default: ""),
        url: entry.at("url", default: ""),
        icon: icon-for(entry.at("icon", default: "")),
      )
    }
  }
}

#let render-awards(section) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str { (name: item, date: "", from: "") } else { item }
      award(
        name: entry.at("name", default: ""),
        date: entry.at("date", default: ""),
        from: entry.at("from", default: ""),
        details: entry.at("details", default: ""),
      )
    }
  }
}

#let render-serving(section) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str { (name: item, description: "", date: "") } else { item }
      serving(
        name: entry.at("name", default: ""),
        description: entry.at("description", default: ""),
        date: entry.at("date", default: ""),
      )
    }
  }
}

#let render-contacts(base-contacts, location-label) = {
  let contacts = if base-contacts == none { [] } else {
    base-contacts.map(item => {
      contact(
        icon: icon-for(item.at("icon", default: none)),
        label: rich(item.at("label", default: "")),
        url: item.at("url", default: ""),
      )
    })
  }
  if location-label != none and location-label != "" {
    contacts + (contact(
      icon: icon-for("location"),
      label: rich(location-label),
      url: "",
    ),)
  } else {
    contacts
  }
}

#let default-section-order = (
  "education",
  "experience",
  "publications",
  "patents",
  "projects",
  "skills",
  "artifacts",
  "awards",
  "serving",
)

#let section-title(titles, key, default: none) = if titles != none and type(titles) == dictionary {
  titles.at(key, default: default)
} else {
  default
}

#let section-default-title = (
  education: "Education",
  experience: "Experience",
  publications: "Publications",
  patents: "Patents & Copyrights",
  projects: "Projects",
  skills: "Skills",
  artifacts: "Artifacts",
  awards: "Awards",
  serving: "Serving",
)

#let section-icon = (
  education: education-icon,
  experience: experience-icon,
  publications: publication-icon,
  patents: copyright-icon,
  projects: projects-icon,
  skills: skill-icon,
  artifacts: artifact-icon,
  awards: award-icon,
  serving: serving-icon,
)

#let section-dispatch = (
  education: (titles, get-section, aliases) => render-education(get-section("education")),
  experience: (titles, get-section, aliases) => render-experience(get-section("experience")),
  publications: (titles, get-section, aliases) => {
    let publications-sub = section-title(titles, "publications_sub", default: none)
    if has-text(publications-sub) {
      sec-heading(level: 2, title: publications-sub)
    }
    render-publications(get-section("publications"), aliases)
  },
  patents: (titles, get-section, aliases) => {
    let patents-sub = section-title(titles, "patents_sub", default: none)
    if has-text(patents-sub) {
      v(-0.5em)
      sec-heading(level: 2, title: patents-sub)
    }
    render-patents(get-section("patents"), aliases)
    if get-section("copyrights") != none {
      v(0.5em)
      let copyrights-sub = section-title(titles, "copyrights_sub", default: none)
      if has-text(copyrights-sub) {
        sec-heading(level: 2, title: copyrights-sub)
      }
      render-copyrights(get-section("copyrights"), aliases)
    }
  },
  projects: (titles, get-section, aliases) => render-projects(get-section("projects")),
  skills: (titles, get-section, aliases) => render-skills(get-section("skills")),
  artifacts: (titles, get-section, aliases) => render-artifacts(get-section("artifacts")),
  awards: (titles, get-section, aliases) => render-awards(get-section("awards")),
  serving: (titles, get-section, aliases) => render-serving(get-section("serving")),
)

#let render-section(section, titles, get-section, aliases) = {
  let handler = section-dispatch.at(section, default: none)
  if handler == none {
    none
  } else {
    let heading-title = section-title(titles, section, default: section-default-title.at(section, default: section))
    sec-heading(icon: section-icon.at(section, default: none), title: heading-title)
    handler(titles, get-section, aliases)
  }
}
