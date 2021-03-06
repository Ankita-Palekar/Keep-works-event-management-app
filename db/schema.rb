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

ActiveRecord::Schema.define(version: 20160817154301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendants", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "attending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendants", ["event_id", "user_id"], name: "idx_uniq_event_id_user_id", unique: true, using: :btree
  add_index "attendants", ["event_id"], name: "index_attendants_on_event_id", using: :btree
  add_index "attendants", ["user_id"], name: "index_attendants_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name",        null: false
    t.datetime "event_time"
    t.string   "location"
    t.string   "description"
    t.decimal  "fees"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                               null: false
    t.string   "encrypted_password",                  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name",                                null: false
    t.string   "gender",                              null: false
    t.string   "account_type",           default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
