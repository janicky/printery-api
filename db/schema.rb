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

ActiveRecord::Schema.define(version: 2018_12_19_170309) do

  create_table "color_palettes", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "tax_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "since_cleaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "operations", force: :cascade do |t|
    t.integer "order_id"
    t.integer "machine_id"
    t.integer "status"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_operations_on_machine_id"
    t.index ["order_id"], name: "index_operations_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "company_id"
    t.decimal "price"
    t.integer "count"
    t.date "deadline"
    t.string "description"
    t.integer "paper_size_id"
    t.integer "paper_id"
    t.integer "color_palette_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_palette_id"], name: "index_orders_on_color_palette_id"
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["paper_id"], name: "index_orders_on_paper_id"
    t.index ["paper_size_id"], name: "index_orders_on_paper_size_id"
  end

  create_table "paper_sizes", force: :cascade do |t|
    t.string "name"
    t.integer "width"
    t.integer "height"
    t.decimal "multiplier"
  end

  create_table "papers", force: :cascade do |t|
    t.string "name"
    t.integer "grammage"
    t.decimal "price"
  end

  create_table "release_receipts", force: :cascade do |t|
    t.integer "order_id"
    t.datetime "release_date"
    t.integer "user_id"
    t.decimal "price"
    t.index ["order_id"], name: "index_release_receipts_on_order_id"
    t.index ["user_id"], name: "index_release_receipts_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "from"
    t.datetime "to"
    t.decimal "income"
    t.integer "orders"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_activity"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
