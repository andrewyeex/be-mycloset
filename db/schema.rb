# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_02_173805) do

  create_table "clothings", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "note"
    t.boolean "is_favorite"
    t.integer "rating"
    t.string "date_bought"
    t.string "clothing_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.string "color"
  end

  create_table "outfits", force: :cascade do |t|
    t.integer "shoes_id"
    t.integer "pants_id"
    t.string "tops"
    t.integer "headwear_id"
    t.boolean "is_favorite", default: false
    t.integer "times_worn", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
