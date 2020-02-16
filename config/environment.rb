ENV['SINATRA_ENV'] ||= 'development'
require 'dotenv/load'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

# for ActiveRecord 6+

  set :database_file, './database.yml'

# set :database, {
#   adapter: "sqlite3",
#   database: "db/#{ENV['SINATRA_ENV']}.sqlite3"
# }

require_all 'app'
require_all 'lib'
