require_relative './config/environment'
require_relative './lib/contacts_importer'
require 'sinatra/activerecord/rake'

desc 'Start the console'
task :console do
  Pry.start()
end


desc 'Seed DB with contacts from "contacts.csv" in /lib'
task :import_contacts do
  ContactsImporter.new.import_from_file('./lib/contacts.csv')
end
