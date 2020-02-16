class AddImageToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :image, :string
  end
end
