require_relative 'boot'

require 'rails/all'

# Require RSpotify throughout the app - in case Bundler doesn't do it!
require 'rspotify'


RSpotify.authenticate("db61cf909fd240d2bc061059a0ac77aa", "52ec96b9564d4a63ab4189145e4eb453")

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AlbumSpot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
