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

ActiveRecord::Schema.define(version: 20171127231722) do

  create_table "orders", force: :cascade do |t|
    t.string   "number"
    t.date     "date"
    t.string   "full_name"
    t.date     "shipment_date"
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "country"
    t.string   "zip_number"
    t.boolean  "printed",       default: false, null: false
    t.datetime "printed_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.string   "state"
    t.boolean  "prepared",      default: false, null: false
    t.text     "print_text"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "rows"
    t.integer  "columns"
    t.string   "name"
    t.string   "logo_uid"
    t.string   "logo_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "order_number"
    t.string   "full_name"
    t.string   "street"
    t.string   "street2"
    t.string   "zip_number"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "last_cell_printed"
    t.integer  "page_margin_left",       default: 0,     null: false
    t.integer  "page_margin_right",      default: 0,     null: false
    t.integer  "page_margin_top",        default: 0,     null: false
    t.integer  "page_margin_bottom",     default: 0,     null: false
    t.integer  "tag_margin_left",        default: 0,     null: false
    t.integer  "tag_margin_right",       default: 0,     null: false
    t.integer  "tag_margin_top",         default: 0,     null: false
    t.integer  "tag_margin_bottom",      default: 0,     null: false
    t.integer  "page_width",             default: 210,   null: false
    t.integer  "page_height",            default: 297,   null: false
    t.boolean  "print_lines",            default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
