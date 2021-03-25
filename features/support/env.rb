require "capybara"
require "capybara/cucumber"
require "faker"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = "http://rocklov-web:3000"
    config.default_max_wait_time = 10
end
