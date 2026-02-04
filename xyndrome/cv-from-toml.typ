#import "lib.typ": *

#let icon-map = (
  email: email-icon,
  website: website-icon,
  github: github-icon,
  location: location-icon,
  phone: phone-icon,
  education: education-icon,
  experience: experience-icon,
  publication: publication-icon,
  copyright: copyright-icon,
  projects: projects-icon,
  skills: skill-icon,
  awards: award-icon,
  artifact: artifact-icon,
  serving: serving-icon,
  spada: spada-icon,
)

#let icon-for(name) = if name == none or name == "" { none } else { icon-map.at(name) }

#let normalize-markup(text) = text
  .replace("link-with-icon", "link_with_icon")
  .replace("github-line-icon", "github-icon")
  .replace("precision@k", "precision\\@k")
  .replace("@k", "\\@k")

#let eval-scope = (
  link_with_icon: link_with_icon,
  "link-with-icon": link_with_icon,
  "github-line-icon": github-icon,
)

#let rich(text) = if text == none or text == "" {
  none
} else {
  eval(normalize-markup(text), mode: "markup", scope: eval-scope)
}

#let bullet-list(lines) = if lines == none or lines.len() == 0 {
  []
} else {
  let normalized = lines.map(line => normalize-markup(line))
  eval("- " + normalized.join("\n- "), mode: "markup", scope: eval-scope)
}

#let format-people(people, aliases: ()) = {
  let resolved = if aliases == none { () } else { aliases }
  if type(people) == array {
    people.map(person => {
      if type(person) == dictionary {
        let name = person.at("name")
        let bold = person.at("bold", default: false)
        if bold or resolved.contains(name) { strong(name) } else { name }
      } else {
        if resolved.contains(person) { strong(person) } else { person }
      }
    })
  } else {
    if resolved.contains(people) { strong(people) } else { people }
  }
}

#let opt-text(value) = if value == none or value == "" { none } else { value }

#let render-education(items) = {
  if items != none {
    for item in items {
      edu(
        institution: item.at("institution"),
        degree: item.at("degree"),
        date: item.at("date"),
        details: bullet-list(item.at("details")),
      )
    }
  }
}

#let render-experience(items) = {
  if items != none {
    for item in items {
      exp(
        project: item.at("project"),
        role: item.at("role"),
        org: item.at("org"),
        location: item.at("location"),
        start: item.at("start"),
        end: item.at("end"),
        details: bullet-list(item.at("details")),
      )
    }
  }
}

#let render-publications(items, aliases) = {
  if items != none {
    for item in items {
      paper(
        type: item.at("type"),
        authors: format-people(item.at("authors"), aliases: aliases),
        title: item.at("title"),
        venue: item.at("venue"),
        published: item.at("published"),
        metadata: item.at("metadata"),
        DOI: opt-text(item.at("DOI")),
        tldr: opt-text(item.at("tldr")),
        pdf: opt-text(item.at("pdf")),
      )
    }
  }
}

#let render-patents(items, aliases) = {
  if items != none {
    for item in items {
      patent(
        number: item.at("number"),
        title: item.at("title"),
        inventors: format-people(item.at("inventors"), aliases: aliases),
        filed: item.at("filed"),
        status: item.at("status"),
        country: item.at("country"),
      )
    }
  }
}

#let render-copyrights(items, aliases) = {
  if items != none {
    for item in items {
      copyright(
        title: item.at("title"),
        year: item.at("year"),
        status: item.at("status"),
        country: item.at("country"),
        holders: format-people(item.at("holders"), aliases: aliases),
      )
    }
  }
}

#let render-projects(items) = {
  if items != none {
    for item in items {
      project(
        title: item.at("title"),
        url: item.at("url", default: ""),
        role: item.at("role", default: ""),
        org: item.at("org", default: ""),
        start: item.at("start", default: ""),
        end: item.at("end", default: ""),
        location: item.at("location", default: ""),
        icon: icon-for(item.at("icon", default: "")),
        details: bullet-list(item.at("details")),
      )
    }
  }
}

#let render-skills(items) = {
  if items != none {
    let categories = items.map(item => (
      item.at("label"),
      item.at("items").map(entry => rich(entry)),
    ))
    skills(categories: categories)
  }
}

#let render-artifacts(items) = {
  if items != none {
    for item in items {
      artifact(
        name: item.at("name"),
        tech: item.at("tech"),
        description: item.at("description"),
        year: item.at("year"),
        url: item.at("url", default: ""),
        icon: icon-for(item.at("icon", default: "")),
      )
    }
  }
}

#let render-awards(items) = {
  if items != none {
    for item in items {
      award(
        name: item.at("name"),
        date: item.at("date"),
        from: item.at("from"),
        details: item.at("details"),
      )
    }
  }
}

#let render-serving(items) = {
  if items != none {
    for item in items {
      serving(
        name: item.at("name"),
        description: item.at("description"),
        date: item.at("date"),
      )
    }
  }
}

#let render-contacts(base-contacts, location-label) = {
  let contacts = if base-contacts == none { [] } else { base-contacts.map(item => {
    contact(
      icon: icon-for(item.at("icon")),
      label: rich(item.at("label")),
      url: item.at("url"),
    )
  }) }
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

#let render-cv(profile-path, locale-path) = {
  let profile-data = toml(profile-path)
  let locale-data = toml(locale-path)

  let profile = profile-data.at("profile")
  let locale = locale-data.at("locale")
  let titles = locale-data.at("titles")
  let aliases = profile.at("aliases", default: ())

  show: cv.with(
    en_name: profile.at("en_name"),
    original_name: locale.at("original_name"),
    ruby_name: profile.at("ruby_name"),
    lang: locale.at("lang"),
    contacts: render-contacts(profile-data.at("contacts"), locale.at("location_label")),
  )

  for section in locale.at("section_order") {
    if section == "education" {
      sec-heading(icon: education-icon, title: titles.at("education"))
      render-education(locale-data.at("education"))
    } else if section == "experience" {
      sec-heading(icon: experience-icon, title: titles.at("experience"))
      render-experience(locale-data.at("experience"))
    } else if section == "publications" {
      sec-heading(icon: publication-icon, title: titles.at("publications"))
      if titles.at("publications_sub") != "" {
        sec-heading(level: 2, title: titles.at("publications_sub"))
      }
      render-publications(locale-data.at("publications"), aliases)
    } else if section == "patents" {
      sec-heading(icon: copyright-icon, title: titles.at("patents"))
      sec-heading(level: 2, title: titles.at("patents_sub"))
      render-patents(locale-data.at("patents"), aliases)
      if locale-data.at("copyrights") != none {
        v(0.5em)
        sec-heading(level: 2, title: titles.at("copyrights_sub"))
        render-copyrights(locale-data.at("copyrights"), aliases)
      }
    } else if section == "projects" {
      sec-heading(icon: projects-icon, title: titles.at("projects"))
      render-projects(locale-data.at("projects"))
    } else if section == "skills" {
      sec-heading(icon: skill-icon, title: titles.at("skills"))
      render-skills(locale-data.at("skills"))
    } else if section == "artifacts" {
      sec-heading(icon: artifact-icon, title: titles.at("artifacts"))
      render-artifacts(locale-data.at("artifacts"))
    } else if section == "awards" {
      sec-heading(icon: award-icon, title: titles.at("awards"))
      render-awards(locale-data.at("awards"))
    } else if section == "serving" {
      sec-heading(icon: serving-icon(), title: titles.at("serving"))
      render-serving(locale-data.at("serving"))
    }
  }
}
