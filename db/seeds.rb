ContactsImporter.import_owners_from_csv
ContactsImporter.import_dogs_from_csv
Owner.all.each do |owner|
  if owner.neighborhood.to_s.length > 50
    owner.neighborhood = nil
    owner.save
  end
end
User.create(
  first_name: "admin",
  email: 'admin@email.com',
  password: 'password'
)
