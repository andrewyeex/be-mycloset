class CreateOutfits < ActiveRecord::Migration[5.2]
  def change
    create_table :outfits do |t|
      t.integer :shoes_id
      t.integer :pants_id
      t.string  :tops                       # will be a comma separated string of ids
      t.integer :headwear_id
      t.boolean :is_favorite, default: 0
      t.integer :times_worn, default: 0
      t.timestamps
    end
  end
end
