class CreateWalks < ActiveRecord::Migration[6.0]
  def change
    create_table :walks do |t|
      t.datetime :window_start
      t.datetime :window_end
      t.integer :user_id
      t.integer :dog_id
    end
  end
end
