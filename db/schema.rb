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

ActiveRecord::Schema.define(version: 2020_09_15_121707) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ads", force: :cascade do |t|
    t.string "name"
    t.integer "category"
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
    t.integer "colaborator_id", null: false
    t.integer "ad_id", null: false
    t.decimal "discount", default: "0.0"
    t.decimal "freight", default: "0.0"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ad_id"], name: "index_deals_on_ad_id"
    t.index ["colaborator_id"], name: "index_deals_on_colaborator_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "receipt"
    t.integer "colaborator_id", null: false
    t.integer "deal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["colaborator_id"], name: "index_payments_on_colaborator_id"
    t.index ["deal_id"], name: "index_payments_on_deal_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "ad_id", null: false
    t.string "ask"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "ads", "colaborators"
  add_foreign_key "colaborators", "companies"
  add_foreign_key "colaborators", "users"
  add_foreign_key "deals", "ads"
  add_foreign_key "deals", "colaborators"
  add_foreign_key "payments", "colaborators"
  add_foreign_key "payments", "deals"
  add_foreign_key "questions", "ads"
end
