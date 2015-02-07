require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BasicRailsApp
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.assets.paths << Rails.root.join("vendor", "assets")

    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Configure generators to use third-party gems
    config.generators do |g|
      g.test_framework :rspec,
      view_specs: false,
      helper_specs: false
    end

    # Prevent connecting to the database while precompiling assets
    config.assets.initialize_on_precompile = false
    
    console do
      ActiveRecord::Base.connection
    end
  end
end
