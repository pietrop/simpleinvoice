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

ActiveRecord::Schema.define(version: 20130906202121) do

  create_table "banks", force: true do |t|
    t.string   "sort_code"
    t.string   "account_name"
    t.string   "account_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banks", ["user_id"], name: "index_banks_on_user_id"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "email"
    t.string   "agency_client"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "number"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.boolean  "paid",       default: false
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id"
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
    t.decimal  "rate",        precision: 8, scale: 2
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
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
