require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= 'development'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
