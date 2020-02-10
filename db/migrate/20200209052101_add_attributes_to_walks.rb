class AddAttributesToWalks < ActiveRecord::Migration[6.0]
  def change
    add_column :walks, :created_at, :datetime
    add_column :walks, :updated_at, :datetime
    add_column :walks, :notes, :string
    add_column :walks, :duration, :string
  end
end
