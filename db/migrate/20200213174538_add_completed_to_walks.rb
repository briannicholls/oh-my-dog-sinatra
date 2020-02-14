class AddCompletedToWalks < ActiveRecord::Migration[6.0]
  def change
    add_column :walks, :completed?, :boolean
  end
end
