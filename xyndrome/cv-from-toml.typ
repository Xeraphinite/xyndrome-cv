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

#let to-length(value, fallback) = {
  if value == none { fallback }
  else if type(value) == int or type(value) == float { value * 1pt }
  else { value }
}

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
        (type: "journal", authors: (), title: item, venue: "", published: "", metadata: "", DOI: "", tldr: "", pdf: "")
      } else { item }
      paper(
        type: entry.at("type"),
        authors: format-people(entry.at("authors"), aliases: aliases),
        title: entry.at("title"),
        venue: entry.at("venue"),
        published: entry.at("published"),
        metadata: entry.at("metadata"),
        DOI: opt-text(entry.at("DOI")),
        tldr: opt-text(entry.at("tldr")),
        pdf: opt-text(entry.at("pdf")),
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

#let render-skills(section) = {
  if section != none {
    let categories = section.pairs().map(pair => {
      let key = pair.at(0)
      let entry = pair.at(1)
      let label = if entry.at("label", default: none) != none and entry.at("label") != "" {
        entry.at("label")
      } else {
        key
      }
      (
        label,
        entry.at("items").map(entry => rich(entry)),
      )
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
        details: entry.at("details", default: "")
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

#let render-cv(locale-path, profile-path: none) = {
  let locale-data = toml(locale-path)
  let profile-data = if profile-path == none { locale-data } else { toml(profile-path) }

  let profile = profile-data.at("profile")
  let metadata = locale-data.at("metadata")
  let titles = locale-data.at("sections")
  let aliases = profile.at("aliases", default: ())
  let show-icons = profile.at("show_icons", default: metadata.at("show_icons", default: true))
  let location-label = profile.at("location_label", default: metadata.at("location_label", default: none))

  let base-font = to-length(metadata.at("font_size", default: none), 10pt)
  let heading-size = to-length(metadata.at("heading_size", default: none), base-font + 2pt)
  let subheading-size = to-length(metadata.at("subheading_size", default: none), base-font + 0.5pt)
  let list-size = to-length(metadata.at("list_size", default: none), base-font - 1pt)
  let footer-size = to-length(metadata.at("footer_size", default: none), base-font - 2pt)

  let known_sections = ("education", "experience", "publications", "patents", "projects", "skills", "artifacts", "awards", "serving")
  let section_order = titles.keys().filter(key => known_sections.contains(key))
  let get-section = section => {
    if locale-data.at(section, default: none) == none { none } else { locale-data.at(section) }
  }

  show: cv.with(
    en_name: profile.at("en_name"),
    original_name: metadata.at("original_name"),
    ruby_name: profile.at("ruby_name"),
    lang: metadata.at("lang"),
    text_size: base-font,
    heading_size: heading-size,
    subheading_size: subheading-size,
    list_size: list-size,
    footer_size: footer-size,
    icons_enabled: show-icons,
    contacts: render-contacts(profile.at("contacts"), location-label),
  )

  for section in section_order {
    if section == "education" {
      sec-heading(icon: education-icon, title: titles.at("education"))
      render-education(get-section("education"))
    } else if section == "experience" {
      sec-heading(icon: experience-icon, title: titles.at("experience"))
      render-experience(get-section("experience"))
    } else if section == "publications" {
      sec-heading(icon: publication-icon, title: titles.at("publications"))
      if titles.at("publications_sub") != "" {
        sec-heading(level: 2, title: titles.at("publications_sub"))
      }
      render-publications(get-section("publications"), aliases)
    } else if section == "patents" {
      sec-heading(icon: copyright-icon, title: titles.at("patents"))
      sec-heading(level: 2, title: titles.at("patents_sub"))
      render-patents(get-section("patents"), aliases)
      if locale-data.at("copyrights", default: none) != none {
        v(0.5em)
        sec-heading(level: 2, title: titles.at("copyrights_sub"))
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
}
