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

ActiveRecord::Schema.define(version: 20151212155452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "causes", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type", limit: 255
    t.string   "body",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "contact_details", force: :cascade do |t|
    t.string   "street_address",   limit: 255
    t.string   "city",             limit: 255
    t.string   "state",            limit: 255
    t.string   "zip",              limit: 255, null: false
    t.string   "country",          limit: 255
    t.string   "phone",            limit: 255
    t.datetime "birthday"
    t.text     "description"
    t.integer  "contactable_id",               null: false
    t.string   "contactable_type", limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "website",          limit: 255
    t.string   "twitter_id",       limit: 255
    t.string   "facebook_id",      limit: 255
    t.string   "contact_form",     limit: 255
    t.string   "desc_source",      limit: 255
  end

  add_index "contact_details", ["contactable_id", "contactable_type"], name: "index_contact_details_on_contactable_id_and_contactable_type", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name",              limit: 100, default: "", null: false
    t.integer  "user_id"
    t.integer  "head_id"
    t.text     "description"
    t.string   "type"
    t.string   "facebook_page_url", limit: 250, default: "", null: false
    t.string   "website_url",       limit: 250, default: "", null: false
    t.string   "phone",             limit: 100, default: "", null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "petition_causes", force: :cascade do |t|
    t.integer  "petition_id", null: false
    t.integer  "cause_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "petition_causes", ["petition_id", "cause_id"], name: "index_petition_causes_on_petition_id_and_cause_id", unique: true, using: :btree

  create_table "petition_recipients", force: :cascade do |t|
    t.integer  "petition_id",  null: false
    t.integer  "recipient_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "petition_recipients", ["petition_id", "recipient_id"], name: "index_petition_recipients_on_petition_id_and_recipient_id", unique: true, using: :btree

  create_table "petition_signatures", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "petition_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "petition_signatures", ["user_id", "petition_id"], name: "index_petition_signatures_on_user_id_and_petition_id", unique: true, using: :btree

  create_table "petitions", force: :cascade do |t|
    t.integer  "creator_id",                                         null: false
    t.string   "title",              limit: 255,                     null: false
    t.text     "body",                                               null: false
    t.text     "background",                                         null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "approved",           limit: 255, default: "Pending"
    t.integer  "goal"
    t.boolean  "is_victory",                     default: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "petitions", ["creator_id", "title"], name: "index_petitions_on_creator_id_and_title", using: :btree
  add_index "petitions", ["creator_id"], name: "index_petitions_on_creator_id", using: :btree

  create_table "recipients", force: :cascade do |t|
    t.string   "title",              limit: 255, null: false
    t.string   "first_name",         limit: 255, null: false
    t.string   "middle_name",        limit: 255
    t.string   "last_name",          limit: 255
    t.string   "bioguide_id",        limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "gov_state",          limit: 255
    t.string   "office",             limit: 255
    t.string   "party",              limit: 255
    t.string   "email",              limit: 255
    t.integer  "creator_id"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "recipients", ["bioguide_id"], name: "index_recipients_on_bioguide_id", using: :btree
  add_index "recipients", ["creator_id"], name: "index_recipients_on_creator_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",              limit: 255,               null: false
    t.string   "pw_digest",          limit: 255,               null: false
    t.string   "name",               limit: 255,               null: false
    t.string   "pwreset_token",      limit: 255,               null: false
    t.string   "session_token",      limit: 255,               null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "activated",          limit: 255, default: "f"
    t.string   "activation_token",   limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "provider",           limit: 255
    t.string   "uid",                limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "victories", force: :cascade do |t|
    t.integer  "petition_id",             null: false
    t.string   "description", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "message",                 null: false
  end

  add_index "victories", ["petition_id"], name: "index_victories_on_petition_id", unique: true, using: :btree

end
