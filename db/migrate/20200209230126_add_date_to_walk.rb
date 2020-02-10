class AddDateToWalk < ActiveRecord::Migration[6.0]
  def change
    add_column :walks, :date, :datetime
  end
end
