class CreateClothings < ActiveRecord::Migration[5.2]
  def change
    create_table :clothings do |t|
      t.string :name
      t.string :image
      t.text :note
      t.boolean :is_favorite
      t.integer :rating
      t.string :date_bought
      t.string :clothing_type
      t.timestamps
    end
  end
end
