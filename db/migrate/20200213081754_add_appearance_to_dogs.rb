class AddAppearanceToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :appearance, :strings
  end
end
