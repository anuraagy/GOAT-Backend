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

ActiveRecord::Schema.define(version: 20170121215223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_entries", force: :cascade do |t|
    t.string   "exercise_type",   null: false
    t.integer  "num_repetitions", null: false
    t.float    "weight",          null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_exercise_entries_on_user_id", using: :btree
  end

  create_table "exercise_types", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "food_entries", force: :cascade do |t|
    t.string   "food_type",  null: false
    t.integer  "servings",   null: false
    t.string   "meal_type",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_food_entries_on_user_id", using: :btree
  end

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

  create_table "goals", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "exercise_type", null: false
    t.string   "description",   null: false
    t.string   "goal_number",   null: false
    t.string   "current_value", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_goals_on_user_id", using: :btree
  end

  create_table "item_types", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.string   "image",       null: false
    t.integer  "value",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "purchased_items", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchased_items_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name",                                null: false
    t.string   "token",                               null: false
    t.integer  "level",                  default: 0,  null: false
    t.integer  "speed",                  default: 0,  null: false
    t.integer  "strength",               default: 0,  null: false
    t.integer  "stamina",                default: 0,  null: false
    t.integer  "xp",                     default: 0,  null: false
    t.integer  "coins",                  default: 0,  null: false
    t.integer  "caloric_goal"
    t.integer  "fat_goal"
    t.integer  "carbohydrates_goal"
    t.integer  "protein_goal"
    t.integer  "sugar_goal"
    t.integer  "cholesterol_goal"
    t.integer  "sodium_goal"
    t.integer  "potassium_goal"
    t.integer  "saturated_fat_goal"
    t.integer  "trans_fat_goal"
    t.integer  "vitamin_a_goal"
    t.integer  "vitamin_c_goal"
    t.integer  "vitamin_d_goal"
    t.integer  "calcium_goal"
    t.integer  "iron_goal"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
