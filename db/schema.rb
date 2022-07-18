# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_17_154015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chars", force: :cascade do |t|
    t.string "name"
    t.string "race"
    t.string "sub_race"
    t.string "klass"
    t.string "sub_class"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chars_teams", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "char_id"
    t.index ["char_id"], name: "index_chars_teams_on_char_id"
    t.index ["team_id"], name: "index_chars_teams_on_team_id"
  end

  create_table "group_players", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_group_players_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "season"
    t.integer "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "markers", force: :cascade do |t|
    t.bigint "map_id", null: false
    t.bigint "category_id", null: false
    t.string "name"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.json "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_markers_on_category_id"
    t.index ["map_id"], name: "index_markers_on_map_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.json "permissions", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "season"
    t.integer "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "attachment"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role_id"
  end

  create_table "validate_jwt_tokens", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "group_players", "groups"
  add_foreign_key "markers", "categories"
  add_foreign_key "markers", "maps"
end
