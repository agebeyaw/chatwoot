module PortalHelper
  def generate_portal_bg_color(portal_color, theme)
    base_color = theme == 'dark' ? 'black' : 'white'
    "color-mix(in srgb, #{portal_color} 0%, #{base_color})"
  end

  def generate_portal_bg(portal_color, theme)
    bg_image = theme == 'dark' ? 'hexagon-dark.svg' : 'hexagon-light.svg'
    "background: url(/assets/images/hc/#{bg_image}) #{generate_portal_bg_color(portal_color, theme)}"
  end

  def language_name(locale)
    language_map = YAML.load_file(Rails.root.join('config/languages/language_map.yml'))
    language_map[locale] || locale
  end

  def get_theme_names(theme)
    if theme == 'light'
      I18n.t('public_portal.header.appearance.light')
    elsif theme == 'dark'
      I18n.t('public_portal.header.appearance.dark')
    else
      I18n.t('public_portal.header.appearance.system')
    end
  end

  def generate_gradient_to_bottom(theme)
    "background-image: linear-gradient(to bottom, transparent, #{theme == 'dark' ? '#151718' : 'white'})"
  end
end
