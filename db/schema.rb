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

ActiveRecord::Schema.define(version: 20160313035445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "applications", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "has_car"
    t.string   "street_address"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "booking_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "event_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "booking_type_id"
  end

  add_index "bookings", ["booking_type_id"], name: "index_bookings_on_booking_type_id", using: :btree
  add_index "bookings", ["employee_id"], name: "index_bookings_on_employee_id", using: :btree
  add_index "bookings", ["event_id"], name: "index_bookings_on_event_id", using: :btree

  create_table "contact_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "content"
    t.boolean  "read",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "phone"
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.integer  "guest_count"
    t.string   "sales_person",   default: "Eddie Kayyali"
    t.string   "event_type",     default: "General"
    t.string   "contact_name"
    t.string   "contact_number"
    t.string   "street_address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state",          default: "Florida"
    t.decimal  "price"
    t.boolean  "paid",           default: false
    t.text     "notes"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.time     "start_time"
    t.time     "end_time"
    t.date     "date"
    t.string   "excelfile"
    t.boolean  "confirmed"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "guest_count"
    t.string   "sales_person",   default: "Eddie Kayyali"
    t.string   "event_type",     default: "General"
    t.string   "contact_name"
    t.string   "contact_number"
    t.string   "contact_email"
    t.string   "street_address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state",          default: "Florida"
    t.integer  "staff"
    t.decimal  "price"
    t.boolean  "paid",           default: false
    t.text     "notes"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nbcomments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "nova_bulletin_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "nbcomments", ["nova_bulletin_id"], name: "index_nbcomments_on_nova_bulletin_id", using: :btree
  add_index "nbcomments", ["user_id"], name: "index_nbcomments_on_user_id", using: :btree

  create_table "note_locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "note_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "notes", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "note_type_id"
    t.integer  "note_location_id"
  end

  add_index "notes", ["note_location_id"], name: "index_notes_on_note_location_id", using: :btree
  add_index "notes", ["note_type_id"], name: "index_notes_on_note_type_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "nova_bulletins", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payrollentries", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "week_start_date"
    t.date     "week_end_date"
    t.date     "submission_date"
    t.decimal  "gross_total"
    t.decimal  "net_total"
    t.integer  "user_id"
  end

  add_index "payrollentries", ["user_id"], name: "index_payrollentries_on_user_id", using: :btree

  create_table "payrollitems", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name_of_employee"
    t.decimal  "gross_pay"
    t.decimal  "net_pay"
    t.decimal  "medicare_tax"
    t.decimal  "employers_tax"
    t.integer  "payrollentry_id"
  end

  add_index "payrollitems", ["payrollentry_id"], name: "index_payrollitems_on_payrollentry_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "profiles", ["employee_id"], name: "index_profiles_on_employee_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "shift_reports", force: :cascade do |t|
    t.text     "body"
    t.integer  "location_id"
    t.integer  "shift_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shift_reports", ["location_id"], name: "index_shift_reports_on_location_id", using: :btree
  add_index "shift_reports", ["shift_id"], name: "index_shift_reports_on_shift_id", using: :btree

  create_table "shift_types", force: :cascade do |t|
    t.decimal  "rate"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
  end

  add_index "shift_types", ["location_id"], name: "index_shift_types_on_location_id", using: :btree

  create_table "shifts", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "employee_id"
    t.integer  "shift_type_id"
    t.integer  "location_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "shifts", ["employee_id"], name: "index_shifts_on_employee_id", using: :btree
  add_index "shifts", ["location_id"], name: "index_shifts_on_location_id", using: :btree
  add_index "shifts", ["shift_type_id"], name: "index_shifts_on_shift_type_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
