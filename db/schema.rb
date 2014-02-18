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

ActiveRecord::Schema.define(:version => 20140218233836) do

  create_table "contact_details", :force => true do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip",              :null => false
    t.string   "country"
    t.string   "phone"
    t.datetime "birthday"
    t.text     "description"
    t.integer  "contactable_id",   :null => false
    t.string   "contactable_type", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "website"
  end

  add_index "contact_details", ["contactable_id", "contactable_type"], :name => "index_contact_details_on_contactable_id_and_contactable_type"

  create_table "petition_signatures", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "petition_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "petition_signatures", ["user_id", "petition_id"], :name => "index_petition_signatures_on_user_id_and_petition_id", :unique => true

  create_table "petitions", :force => true do |t|
    t.integer  "creator_id",                    :null => false
    t.string   "title",                         :null => false
    t.text     "body",                          :null => false
    t.text     "background",                    :null => false
    t.boolean  "approved",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "petitions", ["creator_id"], :name => "index_petitions_on_creator_id"

  create_table "users", :force => true do |t|
    t.string   "email",                          :null => false
    t.string   "pw_digest",                      :null => false
    t.string   "name",                           :null => false
    t.string   "authorized",    :default => "f"
    t.string   "pwreset_token",                  :null => false
    t.string   "auth_token",                     :null => false
    t.string   "session_token",                  :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "victories", :force => true do |t|
    t.integer  "petition_id",  :null => false
    t.string   "text",         :null => false
    t.string   "description",  :null => false
    t.date     "victory_date", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "victories", ["petition_id"], :name => "index_victories_on_petition_id"

end
