require "capybara"
require "capybara/cucumber"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 10
end
