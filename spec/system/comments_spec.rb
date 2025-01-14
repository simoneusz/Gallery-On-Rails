require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
url = "http://localhost:3000"
def log_in(driver, url)
  driver.navigate.to "#{url}/users/sign_in"

  email_field = driver.find_element(id: "user_email")
  password_field = driver.find_element(id: "user_password")
  submit = driver.find_element(name: "commit")
  p email_field
  email_field.send_keys "simoneewarlet@gmail.com"
  password_field.send_keys "simoneewarlet@gmail.com"
  p submit.text
  submit.click
end
log_in(driver, url)
driver.manage.timeouts.page_load = 4
driver.navigate.to "#{url}/categories/cats-2/images/114"

# element.send_keys "Hello WebDriver!"
# element.submit

# puts driver.title
