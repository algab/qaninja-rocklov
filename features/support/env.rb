require "capybara"
require "capybara/cucumber"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

def create_folder_logs
    Dir.mkdir "logs" unless File.exists?("logs")
end

Capybara.configure do |config|
    create_folder_logs
    config.default_driver = :selenium_chrome
    config.app_host = CONFIG["url"]
    config.default_max_wait_time = 10
end
