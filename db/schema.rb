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

ActiveRecord::Schema.define(version: 20150714100259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id",                  null: false
    t.boolean  "right_answer", default: false
    t.text     "answer"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.integer  "types"
    t.string   "location",           limit: 255
    t.text     "preview"
    t.text     "body"
    t.datetime "published_at"
    t.datetime "published_to"
    t.string   "vid_url",            limit: 255
    t.string   "image_uid",          limit: 255
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "blocks", force: :cascade do |t|
    t.integer  "user_id",                                       null: false
    t.string   "reason",       limit: 255, default: "Blocked."
    t.datetime "blocked_at"
    t.datetime "unblocked_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string "lsd_ids",  limit: 255,                     null: false
    t.string "map_id",   limit: 255,                     null: false
    t.string "name",     limit: 255, default: "Город"
    t.string "district", limit: 255, default: "Область"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string "name",  limit: 255,              null: false
    t.string "desc",  limit: 255, default: ""
    t.string "phone", limit: 255, default: ""
  end

  create_table "info_desks", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "contact_tel",     limit: 255, null: false
    t.string   "contact_email",   limit: 255, null: false
    t.string   "private_tel",     limit: 255
    t.string   "private_email",   limit: 255
    t.string   "position",        limit: 255, null: false
    t.integer  "organization_id",             null: false
    t.integer  "department_id",               null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "map_data", force: :cascade do |t|
    t.integer  "city_id",             null: false
    t.datetime "date"
    t.integer  "primary_dr_ticket"
    t.integer  "secondary_dr_ticket"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string  "address",       limit: 255, null: false
    t.integer "city_id",                   null: false
    t.string  "name",          limit: 255, null: false
    t.text    "description"
    t.string  "logo",          limit: 255
    t.string  "tel_secretary", limit: 255
    t.string  "fax",           limit: 255
    t.string  "city_code",     limit: 255, null: false
    t.integer "key"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question",               null: false
    t.integer  "types",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "ancestry"
  end

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "primary_reception"
    t.integer  "finished_reception"
    t.datetime "date"
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer  "question_id",  null: false
    t.integer  "answer_id",    null: false
    t.datetime "date_filling", null: false
    t.string   "client_ip",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_answers", ["answer_id"], name: "index_user_answers_on_answer_id", using: :btree
  add_index "user_answers", ["question_id"], name: "index_user_answers_on_question_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "username",               limit: 255
    t.boolean  "admin",                              default: false
    t.boolean  "moderator",                          default: false
    t.boolean  "boolean",                            default: false
    t.string   "fio",                    limit: 255
    t.string   "hospital",               limit: 255
    t.boolean  "blocks",                             default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "ancestry",               limit: 255
    t.boolean  "top_manager",                        default: false
    t.boolean  "middle_person",                      default: false
    t.integer  "role_id",                            default: 4
  end

  add_index "users", ["ancestry"], name: "index_users_on_ancestry", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
