ENV['SINATRA_ENV'] = 'test'

require_relative '../config/environment'
require "bundler/setup"

RSpec.configure do |config|
  #config.run_all_when_everything_filtered = true
  #config.filter_run :focus
  #config.include Rack::Test::Methods
  #config.include Capybara::DSL
  DatabaseCleaner.strategy = :truncation

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end


  config.order = 'default'
end

ActiveRecord::Base.logger.level = 1
