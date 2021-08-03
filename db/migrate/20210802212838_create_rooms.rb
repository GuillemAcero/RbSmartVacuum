class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :m
      t.integer :n
      t.integer :furniture_count

      t.timestamps
    end
  end
end
