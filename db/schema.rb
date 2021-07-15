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

ActiveRecord::Schema.define(version: 2021_07_15_130234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drink_plans", force: :cascade do |t|
    t.string "name", null: false
    t.text "note"
    t.integer "time_unit", default: 0, null: false
    t.integer "adult_fee", null: false
    t.integer "student_fee", null: false
    t.integer "senior_fee", null: false
    t.integer "child_fee", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "main_plans", force: :cascade do |t|
    t.string "name", null: false
    t.text "note"
    t.integer "div_member", default: 0, null: false
    t.integer "div_day", default: 0, null: false
    t.integer "div_time", default: 0, null: false
    t.integer "time_unit", default: 0, null: false
    t.integer "adult_fee", null: false
    t.integer "student_fee", null: false
    t.integer "senior_fee", null: false
    t.integer "child_fee", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
