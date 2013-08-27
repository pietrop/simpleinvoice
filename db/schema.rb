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

ActiveRecord::Schema.define(version: 20130827094512) do

  create_table "invoices", force: true do |t|
    t.integer  "number"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id"

  create_table "notes", force: true do |t|
    t.text     "text"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["invoice_id"], name: "index_notes_on_invoice_id"

  create_table "services", force: true do |t|
    t.date     "date"
    t.string   "description"
    t.integer  "rate"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit_type"
  end

  add_index "services", ["invoice_id"], name: "index_services_on_invoice_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
