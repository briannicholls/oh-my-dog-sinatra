class AddAttributesToWalks < ActiveRecord::Migration[6.0]
  def change
    add_column :walks, :notes, :string
    add_column :walks, :duration, :string
  end
end
