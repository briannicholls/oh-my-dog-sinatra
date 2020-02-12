class AddNeighborhoodToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :neighborhood, :string
  end
end
