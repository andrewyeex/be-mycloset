class UpdateColumnsInClothings < ActiveRecord::Migration[5.2]
  def change
    change_column :clothings, :image, :string, unique: true
    add_column :clothings, :brand, :string
    add_column :clothings, :color, :string
  end
end
