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

ActiveRecord::Schema.define(version: 20190210205746) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address1",   limit: 255
    t.string   "address2",   limit: 255
    t.string   "city",       limit: 255
    t.string   "state_name", limit: 255
    t.string   "zipcode",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "number",     limit: 255
    t.integer  "vendor_id",  limit: 4
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "orders", ["vendor_id"], name: "index_orders_on_vendor_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.string   "tracking_number",        limit: 255
    t.integer  "order_id",               limit: 4
    t.datetime "expected_delivery_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "address_id",             limit: 4
    t.datetime "shipped_at"
    t.datetime "delivered_at"
    t.string   "status",                 limit: 255
  end

  add_index "shipments", ["address_id"], name: "index_shipments_on_address_id", using: :btree
  add_index "shipments", ["order_id"], name: "index_shipments_on_order_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "orders", "vendors"
  add_foreign_key "shipments", "addresses"
  add_foreign_key "shipments", "orders"
end
