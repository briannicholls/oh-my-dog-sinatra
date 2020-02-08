require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrate that DB, yo!'
end

use Rack::MethodOverride

run ApplicationController
