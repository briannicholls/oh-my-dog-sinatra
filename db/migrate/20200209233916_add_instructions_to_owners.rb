class AddInstructionsToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :instructions, :string
  end
end
