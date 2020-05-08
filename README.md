# OhMyDogSinatra

The official web app of Oh My Dog! Pet Care.

Keeps track of all walks, dogs, owners, and users.

Uses bcrypt for user password authentication.

Support for importing contacts from Google CSV.

Video Demo: https://youtu.be/fA9cVEraJV8

Blog post: https://briannicholls.home.blog/2020/02/15/sinatra-project-web-app-for-a-dog-walking-business/

## Installation

Download the repo, navigate to the root directory and run `bundle install`

Run `shotgun` to start the application on a localhost. You can also use `rake console` to seed the database, or use the import function to import your own contacts (see below).

## Usage

After creating a User account, you will be able to log in. There are four views, Owners, Dogs, Users, and Walks. You can only delete your own user account (admin support will eventually come).

## Importing from .CSV

Two Rake tasks are available for importing Dogs and Owners from CSV.
CSV files should be placed and named appropriatelyin `db/import/csv/[model].csv`

First import Owners, then Dogs:

   ```ruby
   rake import_owners_from_csv
   rake import_dogs_from_csv
   ```
   The import methods will look for the following column headers, feel free to adjust the import methods for importing different attributes:

   ```ruby
   data = SmarterCSV.process('./db/import/csv/owners.csv')
   data.each do |owner_hash|
     o = Owner.new(
       id: owner_hash[:id],
       first_name: owner_hash[:name],
       phone: owner_hash[:phone],
       address: owner_hash[:address1],
       apartment_number: owner_hash[:address2],
       zip_code: owner_hash[:zip_code],
       lockbox_code: owner_hash[:lockbox_code],
       door_code: owner_hash[:door_code]
     )
     o.save
   end

   data = SmarterCSV.process('./db/import/csv/dogs.csv')
   data.each do |dog_hash|
     d = Dog.new(
       id: dog_hash[:id],
       name: dog_hash[:name],
       breed: dog_hash[:breed],
       temperament: dog_hash[:temperament],
       notes: dog_hash[:notes],
       owner_id: dog_hash[:owner_id]
     )
     d.save
   end
   ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nichol88/oh_my_dog_sinatra. This project is intended to be a safe, welcoming space for collaboration.

## License

Copyright (C) 2020 Brian Nicholls

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
