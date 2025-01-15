require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'selenium-webdriver'
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
Dir[Rails.root.join('spec/factories/**/*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request

  config.before(:each, type: :controller) do
    Rails.application.reload_routes_unless_loaded
  end

  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
