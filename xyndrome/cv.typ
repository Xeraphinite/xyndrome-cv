#import "core.typ": cv
#import "sections/render.typ": default-section-order, render-contacts, render-section
#import "utils.typ": rich, to-length

#let heading-size-override = state("heading-size-override", none)
#let subheading-size-override = state("subheading-size-override", none)
#let list-size-override = state("list-size-override", none)

#let render-cv(locale-path, config-path: none) = {
  let empty-style = (text_size: none, heading_size: none, subheading_size: none, list_size: none)
  let default-profile = (
    en_name: "",
    original_name: "",
    furigana_name: none,
    furigana: none,
    aliases: (),
    location_label: none,
    show_icons: true,
    contacts: (),
  )
  let default-config = (
    global: (
      lang: "en",
      show_furigana: true,
      font_size: 10,
      heading_size: 12,
      subheading_size: 10.5,
      list_size: 9,
      font_serif: "Spectral",
      font_serif_cjk: "Noto Serif SC",
      font_sans: "Rethink Sans",
      font_mono: "Inconsolata",
      font_math: "New Computer Modern Math",
      footer_size: 8,
    ),
    header: (
      name_size: 18,
      name_weight: "bold",
      original_name_size: 15.3,
      original_name_weight: "black",
      contact_size: 9,
    ),
    footer: (
      show_name: true,
      text: "",
      show_updated: true,
      updated_prefix: "Last Updated:",
      show_page: true,
      page_format: "1 of 1",
    ),
    sections: (default: empty-style),
  )

  let locale-data = toml(locale-path)
  let config-data = if config-path == none { default-config } else { toml(config-path) }
  let metadata = locale-data.at("metadata", default: none)
  let profile = locale-data.at("profile", default: none)
  let profile-value = (key, default: none) => {
    let from-profile = if profile != none and type(profile) == dictionary {
      profile.at(key, default: none)
    } else {
      none
    }
    if from-profile != none {
      from-profile
    } else {
      if metadata != none and type(metadata) == dictionary {
        metadata.at(key, default: default)
      } else {
        default
      }
    }
  }

  let global-config = config-data.at("global", default: default-config.global)
  let header-config = config-data.at("header", default: default-config.header)
  let footer-config = config-data.at("footer", default: default-config.footer)
  let section-config = config-data.at("sections", default: default-config.sections)

  let aliases = profile-value("aliases", default: default-profile.aliases)
  let en-name = profile-value("en_name", default: default-profile.en_name)
  let original-name = profile-value("original_name", default: default-profile.original_name)
  let furigana-name = profile-value("furigana_name", default: original-name)
  let furigana = profile-value("furigana", default: default-profile.furigana)
  let show-icons = profile-value("show_icons", default: default-profile.show_icons)
  let location-label = profile-value("location_label", default: default-profile.location_label)
  let contacts = profile-value("contacts", default: default-profile.contacts)

  let lang = global-config.at("lang", default: "en")
  let show-furigana = global-config.at("show_furigana", default: true)
  let base-font = to-length(global-config.at("font_size", default: none), 10pt)
  let heading-size = to-length(global-config.at("heading_size", default: none), base-font + 2pt)
  let subheading-size = to-length(global-config.at("subheading_size", default: none), base-font + 0.5pt)
  let list-size = to-length(global-config.at("list_size", default: none), base-font - 1pt)
  let footer-size = to-length(global-config.at("footer_size", default: none), base-font - 2pt)
  let font-serif-primary = global-config.at("font_serif", default: "Spectral")
  let font-serif-secondary = global-config.at("font_serif_cjk", default: "Noto Serif SC")
  let font-sans = global-config.at("font_sans", default: "Rethink Sans")
  let font-mono = global-config.at("font_mono", default: "Inconsolata")
  let font-math = global-config.at("font_math", default: "New Computer Modern Math")

  let header-name-size = to-length(header-config.at("name_size", default: none), 18pt)
  let header-name-weight = header-config.at("name_weight", default: "bold")
  let header-original-size = to-length(header-config.at("original_name_size", default: none), 15.3pt)
  let header-original-weight = header-config.at("original_name_weight", default: "black")
  let header-contact-size = to-length(header-config.at("contact_size", default: none), 9pt)

  let footer-show-name = footer-config.at("show_name", default: true)
  let footer-text = rich(footer-config.at("text", default: default-config.footer.text))
  let footer-show-updated = footer-config.at("show_updated", default: true)
  let footer-updated-prefix = footer-config.at("updated_prefix", default: "Last Updated:")
  let footer-show-page = footer-config.at("show_page", default: true)
  let footer-page-format = footer-config.at("page_format", default: "1 of 1")

  let default-style = section-config.at("default", default: empty-style)
  let style-for = section-name => {
    let section-style = section-config.at(section-name, default: empty-style)
    (
      text_size: to-length(section-style.at("text_size", default: default-style.at("text_size", default: none)), none),
      heading_size: to-length(section-style.at("heading_size", default: default-style.at("heading_size", default: none)), none),
      subheading_size: to-length(section-style.at("subheading_size", default: default-style.at("subheading_size", default: none)), none),
      list_size: to-length(section-style.at("list_size", default: default-style.at("list_size", default: none)), none),
    )
  }

  let titles = locale-data.at("sections", default: none)
  let configured-order = if titles != none and type(titles) == dictionary {
    titles.keys().filter(key => default-section-order.contains(key))
  } else {
    ()
  }
  let discovered-order = default-section-order.filter(section =>
    locale-data.at(section, default: none) != none and not configured-order.contains(section)
  )
  let section-order = configured-order + discovered-order
  let get-section = section => {
    if locale-data.at(section, default: none) == none { none } else { locale-data.at(section) }
  }

  show: cv.with(
    en_name: en-name,
    original_name: original-name,
    furigana_name: furigana-name,
    furigana: furigana,
    show_furigana: show-furigana,
    lang: lang,
    text_size: base-font,
    heading_size: heading-size,
    subheading_size: subheading-size,
    list_size: list-size,
    font_serif_primary: font-serif-primary,
    font_serif_secondary: font-serif-secondary,
    font_sans: font-sans,
    font_mono: font-mono,
    font_math: font-math,
    header_name_size: header-name-size,
    header_name_weight: header-name-weight,
    header_original_name_size: header-original-size,
    header_original_name_weight: header-original-weight,
    header_contact_size: header-contact-size,
    footer_size: footer-size,
    footer_show_name: footer-show-name,
    footer_text: footer-text,
    footer_show_updated: footer-show-updated,
    footer_updated_prefix: footer-updated-prefix,
    footer_show_page: footer-show-page,
    footer_page_format: footer-page-format,
    icons_enabled: show-icons,
    contacts: render-contacts(contacts, location-label),
  )

  for section in section-order {
    let section-style = style-for(section)
    context {
      heading-size-override.update(section-style.at("heading_size"))
      subheading-size-override.update(section-style.at("subheading_size"))
      list-size-override.update(section-style.at("list_size"))
      if section-style.at("text_size") != none {
        set text(size: section-style.at("text_size"))
      }
      render-section(section, titles, get-section, aliases)
    }
  }
}
