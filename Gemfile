source "https://rubygems.org"

gem "rails", "~> 8.0.0"
gem "pg", "~> 1.1"
gem "sqlite3"
gem "puma", ">= 5.0"

# Frontend, assets
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jquery-rails"

# Security
gem "bcrypt", "~> 3.1.7"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "recaptcha"

# Utils
gem "jbuilder"
gem "image_processing", "~> 1.2"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

# Proructivity, background jobs
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Administration, administrating
gem "devise", "~> 4.9"
gem "friendly_id", "~> 5.5.0"
gem "kaminari"
gem "carrierwave", "~> 3.0"
gem "activeadmin"
gem "resque"

# Additional tools
gem "haml-rails", "~> 2.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 7.0.0"
end

group :development do
  gem "web-console"
  gem "html2haml"
end

group :test do
  gem "capybara"
  gem "shoulda-matchers", "~> 6.0"
  gem "selenium-webdriver"
  gem "faker"
  gem "rails-controller-testing"
  gem "factory_bot", "~> 6.5"
end
