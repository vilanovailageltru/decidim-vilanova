Decidim.seed! if Rails.env.development?

organization = Decidim::Organization.first || Decidim::Organization.new
organization.scopes.destroy_all

organization.available_locales = [:ca, :es]
organization.default_locale = :ca
organization.host = ENV['APP_HOST'] || 'localhost'
organization.name = 'Participa Vilanova'
organization.official_url = 'https://www.vilanova.cat'
organization.reference_prefix = 'VG'

organization.description = {
  ca: "Benvingut i benvinguda a la web de participació ciutadana de Vilanova i la Geltrú. A través d’aquest espai podràs obrir debats, opinar, fer propostes i decidir sobre el temes de ciutat que t’interessen.",
  es: "Bienvenidos y bienvenidas a la web de participación ciudadana de Vilanova i la Geltrú. A través de este espacio podrás abrir debates, opinar, hacer propuestas y decidir sobre los temas de la ciudad que te interesan."
}

organization.twitter_handler = 'ajuntamentvng'
organization.facebook_handler = 'ajuntamentvng'
organization.instagram_handler = 'ajuntamentdevilanovailageltru'
organization.youtube_handler = 'devilanovailageltru'
organization.github_handler = 'vilanovailageltru'

organization.logo = File.new(Rails.root.join('db', 'seeds', 'vilanova-logo-white.png'))
organization.official_img_footer = File.new(Rails.root.join('db', 'seeds', 'vilanova-logo-white-footer.png'))
organization.official_img_header = File.new(Rails.root.join('db', 'seeds', 'vilanova-badge.png'))
organization.favicon = File.new(Rails.root.join('db', 'seeds', 'favicon.png'))

organization.save!

welcome_text = {
  ca: "Construïm entre tots i totes la ciutat que volem",
  es: "Construyamos entre todos y todas la ciudad que queremos"
}
content_block = Decidim::ContentBlock.find_or_create_by(organization: organization, scope_name: :homepage, manifest_name: :hero)
settings = {}
settings = welcome_text.inject(settings) { |acc, (k, v)| acc.update("welcome_text_#{k}" => v) }
content_block.settings = settings
content_block.images_container.background_image = File.new(Rails.root.join('db', 'seeds', 'vilanova-hero-home.jpg'))
content_block.settings_will_change!
content_block.images_will_change!
content_block.save!

organization.static_pages.find_or_initialize_by(slug: 'faq').update(
  title: { ca: 'Què és Participa Vilanova i la Geltrú?', es: '¿Qué es Participa Vilanova i la Geltrú?' },
  content: {
    ca: File.new(Rails.root.join('db', 'seeds', 'faq.ca.html')).read,
    es: File.new(Rails.root.join('db', 'seeds', 'faq.es.html')).read
  }
)

organization.static_pages.find_or_initialize_by(slug: 'terms-and-conditions').update(
  title: { ca: "Termes i condicions d'ús", es: 'Términos y condiciones de uso' },
  content: {
    ca: File.new(Rails.root.join('db', 'seeds', 'terms.ca.html')).read,
    es: File.new(Rails.root.join('db', 'seeds', 'terms.es.html')).read
  }
)

organization.static_pages.find_or_initialize_by(slug: 'accessibility').update(
  title: { ca: 'Accessibilitat', es: 'Accesibilidad' },
  content: {
    ca: File.new(Rails.root.join('db', 'seeds', 'accessibility.ca.html')).read,
    es: File.new(Rails.root.join('db', 'seeds', 'accessibility.es.html')).read
  }
)
