# frozen_string_literal: true

source 'https://rubygems.org'

gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 8.0.0'
gem 'sqlite3'

# Frontend, assets
gem 'cssbundling-rails'
gem 'importmap-rails'
gem 'jquery-rails'
gem 'propshaft'
gem 'stimulus-rails'
gem 'turbo-rails'

# Security
gem 'bcrypt', '~> 3.1.7'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection', '~> 1.0'
gem 'recaptcha'

# Utils
gem 'bootsnap', require: false
gem 'image_processing', '~> 1.2'
gem 'jbuilder'
gem 'kamal', require: false
gem 'thruster', require: false

# Proructivity, background jobs
gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

# Administration, administrating
gem 'activeadmin'
gem 'carrierwave', '~> 3.0'
gem 'devise', '~> 4.9'
gem 'friendly_id', '~> 5.5.0'
gem 'kaminari'
gem 'resque'

# Additional tools
gem 'haml-rails', '~> 2.0'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'rspec-rails', '~> 7.0.0'
  gem 'rubocop'
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  gem 'html2haml'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'factory_bot', '~> 6.5'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 6.0'
end
