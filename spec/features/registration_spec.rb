require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  before do
    Capybara.current_driver = :selenium
  end

  after do
    Capybara.use_default_driver
  end

  it 'registers a new user successfully' do
    visit '/users/sign_up'

    fill_in 'user_username', with: 'selenium'
    fill_in 'user_email', with: 'selenium@gmail.com'
    fill_in 'user_password', with: 'selenium@gmail.com'
    fill_in 'user_password_confirmation', with: 'selenium@gmail.com'

    click_button 'commit'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
