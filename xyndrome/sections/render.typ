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

#let icon-for(name) = if name == none or name == "" { none } else { icon-map.at(name) }

#let render-education(section) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str { (institution: item, degree: "", date: "", details: ()) } else { item }
      edu(
        institution: entry.at("institution"),
        degree: entry.at("degree"),
        date: entry.at("date"),
        details: bullet-list(entry.at("details")),
      )
    }
  }
}

#let render-experience(section) = {
  if section != none {
    for item in section.values() {
      let entry = if type(item) == str { (project: item, role: "", org: "", location: "", start: "", end: "", details: ()) } else { item }
      exp(
        project: entry.at("project"),
        role: entry.at("role"),
        org: entry.at("org"),
        location: entry.at("location"),
        start: entry.at("start"),
        end: entry.at("end"),
        summary: entry.at("summary", default: none),
        details: bullet-list(entry.at("details")),
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
        type: entry.at("type"),
        authors: format-people(entry.at("authors"), aliases: aliases),
        title: entry.at("title"),
        venue: entry.at("venue"),
        published: entry.at("published"),
        metadata: entry.at("metadata"),
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
        number: entry.at("number"),
        title: entry.at("title"),
        inventors: format-people(entry.at("inventors"), aliases: aliases),
        filed: entry.at("filed"),
        status: entry.at("status"),
        country: entry.at("country"),
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
        title: entry.at("title"),
        year: entry.at("year"),
        status: entry.at("status"),
        country: entry.at("country"),
        holders: format-people(entry.at("holders"), aliases: aliases),
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
        title: entry.at("title"),
        url: entry.at("url", default: ""),
        role: entry.at("role", default: ""),
        org: entry.at("org", default: ""),
        start: entry.at("start", default: ""),
        end: entry.at("end", default: ""),
        location: entry.at("location", default: ""),
        icon: icon-for(entry.at("icon", default: "")),
        details: bullet-list(entry.at("details")),
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
      let entry = pair.at(1)
      let label = if entry.at("label", default: none) != none and entry.at("label") != "" { entry.at("label") } else { key }
      let items = entry.at("items").map(item => render-skill-item(item)).filter(item => item != none)
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
        name: entry.at("name"),
        tech: entry.at("tech"),
        description: entry.at("description"),
        year: entry.at("year"),
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
        name: entry.at("name"),
        date: entry.at("date"),
        from: entry.at("from"),
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
        name: entry.at("name"),
        description: entry.at("description"),
        date: entry.at("date"),
      )
    }
  }
}

#let render-contacts(base-contacts, location-label) = {
  let contacts = if base-contacts == none { [] } else {
    base-contacts.map(item => {
      contact(
        icon: icon-for(item.at("icon")),
        label: rich(item.at("label")),
        url: item.at("url"),
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

#let render-section(section, titles, get-section, aliases) = {
  if section == "education" {
    sec-heading(icon: education-icon, title: titles.at("education"))
    render-education(get-section("education"))
  } else if section == "experience" {
    sec-heading(icon: experience-icon, title: titles.at("experience"))
    render-experience(get-section("experience"))
  } else if section == "publications" {
    sec-heading(icon: publication-icon, title: titles.at("publications"))
    let publications-sub = titles.at("publications_sub", default: none)
    if has-text(publications-sub) {
      sec-heading(level: 2, title: publications-sub)
    }
    render-publications(get-section("publications"), aliases)
  } else if section == "patents" {
    sec-heading(icon: copyright-icon, title: titles.at("patents"))
    let patents-sub = titles.at("patents_sub", default: none)
    if has-text(patents-sub) {
      sec-heading(level: 2, title: patents-sub)
    }
    render-patents(get-section("patents"), aliases)
    if get-section("copyrights") != none {
      v(0.5em)
      let copyrights-sub = titles.at("copyrights_sub", default: none)
      if has-text(copyrights-sub) {
        sec-heading(level: 2, title: copyrights-sub)
      }
      render-copyrights(get-section("copyrights"), aliases)
    }
  } else if section == "projects" {
    sec-heading(icon: projects-icon, title: titles.at("projects"))
    render-projects(get-section("projects"))
  } else if section == "skills" {
    sec-heading(icon: skill-icon, title: titles.at("skills"))
    render-skills(get-section("skills"))
  } else if section == "artifacts" {
    sec-heading(icon: artifact-icon, title: titles.at("artifacts"))
    render-artifacts(get-section("artifacts"))
  } else if section == "awards" {
    sec-heading(icon: award-icon, title: titles.at("awards"))
    render-awards(get-section("awards"))
  } else if section == "serving" {
    sec-heading(icon: serving-icon(), title: titles.at("serving"))
    render-serving(get-section("serving"))
  }
}
