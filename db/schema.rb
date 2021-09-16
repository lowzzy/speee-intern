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

ActiveRecord::Schema.define(version: 2021_09_16_034631) do

  create_table "admin_users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "agencies", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "tel", null: false
    t.string "address"
  end

  create_table "assessments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.bigint "agency_id", null: false
    t.integer "temp_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agency_id"], name: "index_assessments_on_agency_id"
    t.index ["property_id"], name: "index_assessments_on_property_id"
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "candidate_buyers", charset: "utf8mb4", force: :cascade do |t|
    t.text "hearing", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "address", null: false
  end

  create_table "cities", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "prefecture_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mediation_contracts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "temp_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "agency_id"
    t.index ["user_id"], name: "index_mediation_contracts_on_user_id"
  end

  create_table "offers", charset: "utf8mb4", force: :cascade do |t|
    t.integer "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "transacted_on", null: false
    t.bigint "candidate_buyer_id"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "prefectures", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", charset: "utf8mb4", force: :cascade do |t|
    t.integer "age"
    t.integer "prefecture"
    t.string "city"
    t.string "floor_plan"
    t.integer "square_measure"
    t.integer "construction_type"
    t.integer "material_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "kinds"
    t.string "address", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "tel", null: false
    t.integer "status", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assessments", "agencies"
  add_foreign_key "assessments", "properties"
  add_foreign_key "assessments", "users"
  add_foreign_key "mediation_contracts", "users"
  add_foreign_key "offers", "users"
end
