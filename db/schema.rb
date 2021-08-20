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

ActiveRecord::Schema.define(version: 2021_08_20_022242) do

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

  create_table "fee_infos", force: :cascade do |t|
    t.integer "div_member", default: 1, null: false
    t.integer "number_of_adults", default: 0, null: false
    t.integer "number_of_students", default: 0, null: false
    t.integer "number_of_seniors", default: 0, null: false
    t.integer "number_of_children", default: 0, null: false
    t.integer "usage_time", default: 0, null: false
    t.integer "drink_plan", default: 0, null: false
    t.integer "number_of_customers", null: false
    t.integer "total_fee", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "adult_main_fee"
    t.integer "student_main_fee"
    t.integer "senior_main_fee"
    t.integer "child_main_fee"
    t.integer "adult_drink_fee"
    t.integer "student_drink_fee"
    t.integer "senior_drink_fee"
    t.integer "child_drink_fee"
    t.integer "adult_total_fee"
    t.integer "student_total_fee"
    t.integer "senior_total_fee"
    t.integer "child_total_fee"
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
    t.bigint "shop_id"
    t.index ["shop_id"], name: "index_main_plans_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "phone_number"
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "image"
    t.index ["email"], name: "index_shops_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true
  end

  add_foreign_key "main_plans", "shops"
end
