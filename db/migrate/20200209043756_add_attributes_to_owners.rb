class AddAttributesToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :timestamps, :datetime
    add_column :owners, :phone, :string
    add_column :owners, :address, :string
    add_column :owners, :apartment_number, :string
    add_column :owners, :email, :string
    add_column :owners, :zip_code, :string
    add_column :owners, :door_code, :string
    add_column :owners, :lockbox_code, :string
    add_column :owners, :entry_instructions, :string
  end
end
