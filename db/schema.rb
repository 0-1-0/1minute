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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120429125912) do

  create_table "actions", :force => true do |t|
    t.string   "type"
    t.text     "description"
    t.string   "data"
    t.integer  "minutes"
    t.float    "money"
    t.string   "image"
    t.boolean  "instantly",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "actions", ["type"], :name => "index_actions_on_type"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.integer  "target_minimum"
    t.integer  "current_min",    :default => 0
    t.float    "current_money",  :default => 0.0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "events", ["name"], :name => "index_events_on_name"

  create_table "transactions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "action_id"
    t.integer  "event_id"
    t.integer  "minutes"
    t.integer  "money"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "nickname"
    t.string   "provider"
    t.string   "url"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",               :default => "",    :null => false
    t.string   "encrypted_password",  :default => "",    :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin",            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
