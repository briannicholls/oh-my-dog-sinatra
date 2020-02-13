class AddPhone2ToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :phone2, :string
  end
end
