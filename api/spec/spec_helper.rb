require_relative "routes/signup"
require_relative "routes/equipos"
require_relative "routes/sessions"

require_relative "helpers"
require_relative "libs/mongo"

require "digest/md5"

def to_md5(pass)
  return Digest::MD5.hexdigest(pass)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do
    users = [
      { name: "Alvaro API", email: "alvaro_api@email.com", password: to_md5("12345678") },
      { name: "Tomate", email: "to@mate.com", password: to_md5("12345678") },
      { name: "Penelope", email: "penelope@email.com", password: to_md5("12345678") },
      { name: "Ed", email: "ed@email.com", password: to_md5("12345678") },
      { name: "Joe", email: "joe@email.com", password: to_md5("12345678") }
    ]

    MongoDB.new.drop_database
    MongoDB.new.insert_users(users)
  end
end
