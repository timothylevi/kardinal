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

ActiveRecord::Schema.define(:version => 20140225145116) do

  create_table "causes", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.string   "twitter_id"
    t.string   "facebook_id"
    t.string   "contact_form"
    t.string   "desc_source"
  end

  add_index "contact_details", ["contactable_id", "contactable_type"], :name => "index_contact_details_on_contactable_id_and_contactable_type"

  create_table "petition_causes", :force => true do |t|
    t.integer  "petition_id", :null => false
    t.integer  "cause_id",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "petition_causes", ["petition_id", "cause_id"], :name => "index_petition_causes_on_petition_id_and_cause_id", :unique => true

  create_table "petition_recipients", :force => true do |t|
    t.integer  "petition_id",  :null => false
    t.integer  "recipient_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "petition_recipients", ["petition_id", "recipient_id"], :name => "index_petition_recipients_on_petition_id_and_recipient_id", :unique => true

  create_table "petition_signatures", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "petition_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "petition_signatures", ["user_id", "petition_id"], :name => "index_petition_signatures_on_user_id_and_petition_id", :unique => true

  create_table "petitions", :force => true do |t|
    t.integer  "creator_id",                        :null => false
    t.string   "title",                             :null => false
    t.text     "body",                              :null => false
    t.text     "background",                        :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "approved",   :default => "Pending"
    t.integer  "goal"
    t.boolean  "is_victory", :default => false
  end

  add_index "petitions", ["creator_id", "title"], :name => "index_petitions_on_creator_id_and_title"
  add_index "petitions", ["creator_id"], :name => "index_petitions_on_creator_id"

  create_table "recipients", :force => true do |t|
    t.string   "title",              :null => false
    t.string   "first_name",         :null => false
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "bioguide_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "gov_state"
    t.string   "office"
    t.string   "party"
    t.string   "email"
    t.integer  "creator_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "recipients", ["bioguide_id"], :name => "index_recipients_on_bioguide_id"
  add_index "recipients", ["creator_id"], :name => "index_recipients_on_creator_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :null => false
    t.string   "pw_digest",                           :null => false
    t.string   "name",                                :null => false
    t.string   "pwreset_token",                       :null => false
    t.string   "session_token",                       :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "activated",          :default => "f"
    t.string   "activation_token"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["uid"], :name => "index_users_on_uid"

  create_table "victories", :force => true do |t|
    t.integer  "petition_id", :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "message",     :null => false
  end

  add_index "victories", ["petition_id"], :name => "index_victories_on_petition_id", :unique => true

end
