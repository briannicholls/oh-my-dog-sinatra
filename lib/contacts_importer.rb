require 'json'
class ContactsImporter

  def self.import(hash_array)
    hash_array.each do |owner_hash|
      Owner.create(
        first_name: owner_hash[:given_name],
        last_name: owner_hash[:family_name],
        phone: owner_hash[:phone_1___value]
      )
    end
  end

  def self.parse_file(file)
    SmarterCSV.process( file )
  end

  def self.import_from_file(file)
    import(parse_file(file))
  end

  def self.import_owners_from_csv
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
        door_code: owner_hash[:door_code],
        neighborhood: ContactsImporter.neighborhood(owner_hash[:zip_code])
      )
      o.save
    end
  end

  def self.import_dogs_from_csv
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
  end

end
