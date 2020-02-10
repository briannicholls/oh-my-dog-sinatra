class AddAttributesToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :timestamps, :datetime
    add_column :dogs, :breed, :string
    add_column :dogs, :birthday, :datetime
    add_column :dogs, :temperament, :string
    add_column :dogs, :notes, :string
  end
end
