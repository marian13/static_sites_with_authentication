require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

##
# @internal
#   TAGS: static_sites
#
STATIC_SITES = ["code_notes", "docusaurus"]

module StaticSitesWithAuthentication
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    ##
    # Tells Rails to not wrap fields with error with `<div class="field_with_errors">...</div>`.
    # This can happen when trying to sing up with devise without providing email or password.
    #
    # - https://coderwall.com/p/s-zwrg/remove-rails-field_with_errors-wrapper
    # - https://stackoverflow.com/a/16104009/12201472
    #
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag.html_safe }
  end
end
