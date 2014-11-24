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

ActiveRecord::Schema.define(version: 20141120090538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "alembic_version", id: false, force: true do |t|
    t.string "version_num", limit: 32, null: false
  end

  create_table "babysousou_items", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item", force: true do |t|
    t.string "source",          null: false
    t.string "external_id",     null: false
    t.string "title",           null: false
    t.string "price_type",      null: false
    t.hstore "price",           null: false
    t.string "price_currency",  null: false
    t.string "item_url",        null: false
    t.string "image_url",       null: false
    t.text   "description"
    t.hstore "additional_info"
  end

  create_table "items", force: true do |t|
    t.string   "source"
    t.string   "external_id"
    t.string   "title"
    t.string   "price_type"
    t.hstore   "prices"
    t.string   "price_currency"
    t.string   "item_url"
    t.string   "image_url"
    t.text     "description"
    t.hstore   "additional_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "babysousou_item_id"
  end

  add_index "items", ["babysousou_item_id"], name: "index_items_on_babysousou_item_id", using: :btree

end
