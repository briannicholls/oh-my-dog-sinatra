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
end
