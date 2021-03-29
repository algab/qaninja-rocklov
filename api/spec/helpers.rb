module Helpers
  def get_fixture(item)
    YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true)
  end

  def get_thumb(file_name)
    return File.open(File.join(Dir.pwd, "spec/fixtures/images/#{file_name}"), "rb")
  end

  def create_folder_logs
    Dir.mkdir "logs" unless File.exists?("logs")
  end

  module_function :get_fixture
  module_function :get_thumb
  module_function :create_folder_logs
end
