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

ActiveRecord::Schema.define(version: 2020_09_06_172515) do

  create_table "ads", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.decimal "cost"
    t.integer "colaborator_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["colaborator_id"], name: "index_ads_on_colaborator_id"
  end

  create_table "colaborators", force: :cascade do |t|
    t.string "name"
    t.string "social_name"
    t.string "address"
    t.string "role"
    t.integer "company_id", null: false
    t.integer "user_id", null: false
    t.integer "status"
    t.string "section"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "birth_date"
    t.string "cpf"
    t.index ["company_id"], name: "index_colaborators_on_company_id"
    t.index ["user_id"], name: "index_colaborators_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "domain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deals", force: :cascade do |t|
    t.integer "ad_id", null: false
    t.integer "colaborator_id", null: false
    t.integer "status", default: 0
    t.decimal "final_price"
    t.integer "pay_met", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "deliver_diff_ad", default: 0
    t.index ["ad_id"], name: "index_deals_on_ad_id"
    t.index ["colaborator_id"], name: "index_deals_on_colaborator_id"
  end

  create_table "negociations", force: :cascade do |t|
    t.integer "ad_id", null: false
    t.integer "colaborator_id", null: false
    t.string "ask"
    t.string "answer"
    t.decimal "current_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ad_id"], name: "index_negociations_on_ad_id"
    t.index ["colaborator_id"], name: "index_negociations_on_colaborator_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "ask"
    t.integer "ad_id", null: false
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ad_id"], name: "index_questions_on_ad_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "permission", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ads", "colaborators"
  add_foreign_key "colaborators", "companies"
  add_foreign_key "colaborators", "users"
  add_foreign_key "deals", "ads"
  add_foreign_key "deals", "colaborators"
  add_foreign_key "negociations", "ads"
  add_foreign_key "negociations", "colaborators"
  add_foreign_key "questions", "ads"
end
