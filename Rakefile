require_relative './config/environment'
require_relative './lib/contacts_importer'
require 'sinatra/activerecord/rake'
require 'dotenv/tasks'

desc 'Start the console'
task :console do
  Pry.start()
end

desc 'Seed DB with contacts from "contacts.csv" in /lib'
task :import_contacts do
  ContactsImporter.new.import_from_file('./lib/contacts.csv')
end

desc 'Import Owners from db/import/csv/owners.csv'
task :import_owners_from_csv do
  ContactsImporter.import_owners_from_csv
end

desc 'Import Dogs from db/import/csv/dogs.csv'
task :import_dogs_from_csv do
  ContactsImporter.import_dogs_from_csv
end
