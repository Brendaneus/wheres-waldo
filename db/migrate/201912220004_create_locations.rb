
class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.references :picture, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      
      t.integer :x_coord
      t.integer :y_coord

      t.string :hint
    end
  end
end
