require 'bundler/setup'
require 'simplecov'
require 'webmock/rspec'
require 'vcr'

require 'telleroo'

SimpleCov.start do
  add_filter '/spec/'
end

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
