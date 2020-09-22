require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use ApplicationController
use UserController
use Rack::MethodOverride
use LinetrackerController
run ApplicationController
