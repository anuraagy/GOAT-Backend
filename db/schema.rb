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

ActiveRecord::Schema.define(version: 20170121202615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_types", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "serving_size",  null: false
    t.integer  "calories",      null: false
    t.integer  "fat"
    t.integer  "carbohydrates"
    t.integer  "protein"
    t.integer  "sugar"
    t.integer  "cholesterol"
    t.integer  "sodium"
    t.integer  "potassium"
    t.integer  "saturated_fat"
    t.integer  "trans_fat"
    t.integer  "vitamin_a"
    t.integer  "vitamin_c"
    t.integer  "vitamin_d"
    t.integer  "calcium"
    t.integer  "iron"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end