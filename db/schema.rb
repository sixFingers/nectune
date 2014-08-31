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

ActiveRecord::Schema.define(version: 20140831184143) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
  end

  add_index "authors", ["name", "source_id"], name: "index_authors_on_name_and_source_id", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "authorable_id"
    t.string   "authorable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["authorable_id"], name: "index_categories_on_authorable_id", using: :btree

  create_table "categories_items", force: true do |t|
    t.integer "item_id"
    t.integer "category_id"
  end

  add_index "categories_items", ["category_id"], name: "index_categories_items_on_category_id", using: :btree
  add_index "categories_items", ["item_id"], name: "index_categories_items_on_item_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "author_id"
    t.text     "content"
    t.text     "summary"
    t.string   "image"
    t.datetime "published"
    t.datetime "updated"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["url"], name: "index_items_on_url", unique: true, using: :btree

  create_table "links", force: true do |t|
    t.string   "url"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "feed_url"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "sources", ["author_id"], name: "index_sources_on_author_id", using: :btree
  add_index "sources", ["feed_url"], name: "index_sources_on_feed_url", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
