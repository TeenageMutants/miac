# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160226081143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.integer  "types"
    t.text     "preview"
    t.text     "body"
    t.datetime "published_at",       precision: 6
    t.datetime "published_to",       precision: 6
    t.string   "vid_url"
    t.string   "tag"
    t.integer  "user_id",                          null: false
    t.string   "name"
    t.datetime "created_at",         precision: 6, null: false
    t.datetime "updated_at",         precision: 6, null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at",   precision: 6
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "district"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",                             null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   precision: 6
    t.datetime "updated_at",                   precision: 6
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string  "address"
    t.integer "city_id"
    t.string  "name"
    t.text    "description"
    t.string  "logo"
    t.string  "tel_secretary"
    t.string  "fax"
    t.string  "city_code"
    t.integer "key"
    t.integer "type_org_id"
    t.string  "full_name"
    t.string  "tag_ids"
    t.string  "lsd_id"
    t.string  "web_site"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "type_organizations", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at",    precision: 6
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at",     precision: 6
    t.datetime "last_sign_in_at",        precision: 6
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.boolean  "admin",                                default: false
    t.boolean  "moderator",                            default: false
    t.boolean  "boolean",                              default: false
    t.string   "fio"
    t.string   "hospital"
    t.boolean  "blocks",                               default: false
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
