class CreateFurnitures < ActiveRecord::Migration[6.1]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.string :start_p
      t.string :end_p
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
