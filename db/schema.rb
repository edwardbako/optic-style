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

ActiveRecord::Schema.define(version: 20190524053237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_blocks", force: :cascade do |t|
    t.bigint "article_id"
    t.text "text"
    t.string "image"
    t.string "video"
    t.string "audio"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "caption_place", default: 0
    t.index ["article_id"], name: "index_article_blocks_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
    t.string "slug"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "branch_views", force: :cascade do |t|
    t.string "image"
    t.string "description"
    t.integer "position"
    t.boolean "default", default: false
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branch_views_on_branch_id"
  end

  create_table "branches", id: :serial, force: :cascade do |t|
    t.string "address"
    t.string "short_address"
    t.string "phone"
    t.string "open_hours", array: true
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.text "map"
    t.integer "position"
  end

  create_table "client_phones", force: :cascade do |t|
    t.string "number"
    t.bigint "client_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_phones_on_client_id"
  end

  create_table "client_sms", force: :cascade do |t|
    t.bigint "client_phone_id"
    t.text "text"
    t.integer "status"
    t.string "status_text"
    t.string "sms_id"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_phone_id"], name: "index_client_sms_on_client_phone_id"
    t.index ["sms_id"], name: "index_client_sms_on_sms_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.string "phone", default: [], array: true
    t.string "email"
    t.text "comment"
    t.date "birth_date"
    t.boolean "personal_data_agreement", default: true
    t.boolean "email_notification_agreement", default: true
    t.boolean "sms_notification_agreement", default: true
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.tsvector "tsv"
    t.index ["branch_id"], name: "index_clients_on_branch_id"
    t.index ["tsv"], name: "index_clients_on_tsv", using: :gin
  end

  create_table "grams", force: :cascade do |t|
    t.text "body"
    t.string "image"
    t.boolean "published", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_grams_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "icon", default: 0
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.string "number"
    t.string "frame"
    t.string "lenses"
    t.string "sum"
    t.string "comment"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "published", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "product_views", force: :cascade do |t|
    t.string "image"
    t.string "description"
    t.integer "position"
    t.boolean "default", default: false
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_views_on_product_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.text "description"
    t.string "size"
    t.string "color"
    t.string "weight"
    t.string "material"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "RUB", null: false
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.boolean "is_folder", default: false
    t.integer "products_count"
    t.text "info"
    t.boolean "featured"
  end

  create_table "recipes", force: :cascade do |t|
    t.date "date"
    t.string "od_sph"
    t.string "od_cyl"
    t.string "od_ax"
    t.string "od_add"
    t.string "os_sph"
    t.string "os_cyl"
    t.string "os_ax"
    t.string "os_add"
    t.string "dp"
    t.string "comment"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_recipes_on_client_id"
  end

  create_table "user_notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "notification_id"
    t.boolean "checked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_user_notifications_on_notification_id"
    t.index ["user_id"], name: "index_user_notifications_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.integer "role", default: 0
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "article_blocks", "articles"
  add_foreign_key "articles", "users"
  add_foreign_key "branch_views", "branches"
  add_foreign_key "client_phones", "clients"
  add_foreign_key "client_sms", "client_phones"
  add_foreign_key "clients", "branches"
  add_foreign_key "orders", "clients"
  add_foreign_key "product_views", "products"
  add_foreign_key "recipes", "clients"
  add_foreign_key "user_notifications", "notifications"
  add_foreign_key "user_notifications", "users"
end
