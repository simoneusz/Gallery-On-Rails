require 'rails_helper'
def log_in(driver, path)
  driver.navigate.to "#{path}/users/sign_up"

  email_field = driver.find_element(id: 'user_username')
  email_field.send_keys 'features'

  email_field = driver.find_element(id: 'user_email')
  email_field.send_keys 'features@gmail.com'

  password_field = driver.find_element(id: 'user_password')
  password_field.send_keys 'features@gmail.com'

  password_field = driver.find_element(id: 'user_password_confirmation')
  password_field.send_keys 'features@gmail.com'

  submit = driver.find_element(name: 'commit')
  p submit.text
  submit.click
end

driver = Selenium::WebDriver.for :chrome
path = 'http://localhost:3000'

log_in(driver, path)
