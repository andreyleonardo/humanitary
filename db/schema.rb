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

ActiveRecord::Schema.define(version: 20150907144802) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "zip",        limit: 4
    t.string   "activity",   limit: 255
    t.float    "longitude",  limit: 24
    t.float    "latitude",   limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "group_id",   limit: 4
    t.string   "address",    limit: 255
  end

  add_index "addresses", ["group_id"], name: "index_addresses_on_group_id", using: :btree

  create_table "group_addresses", id: false, force: :cascade do |t|
    t.integer "address_id", limit: 4
    t.integer "group_id",   limit: 4
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name",        limit: 255
    t.string   "group_description", limit: 255
    t.string   "responsable_name",  limit: 255
    t.integer  "group_phone",       limit: 8
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "state",             limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               limit: 255, default: "", null: false
    t.string   "encrypted_password",  limit: 255, default: "", null: false
    t.integer  "fb_user_id",          limit: 8
    t.integer  "fb_access_token",     limit: 8
    t.float    "longitude",           limit: 24
    t.float    "latitude",            limit: 24
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "provider",            limit: 255
    t.string   "uid",                 limit: 255
    t.string   "image",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["image"], name: "index_users_on_image", using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  add_foreign_key "addresses", "groups"
end
