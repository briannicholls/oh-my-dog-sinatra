class AddAppearanceToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :appearance, :string
  end
end
