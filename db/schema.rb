# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_05_025446) do
  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

  create_table "dates", force: :cascade do |t|
    t.string "description"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

  create_table "points", force: :cascade do |t|
    t.integer "total_points"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "id_Tournament"
    t.string "name"
  end

end
