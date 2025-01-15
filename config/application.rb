require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module GalleryOnRails
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])
    config.active_job.queue_adapter = :resque
  end
end
