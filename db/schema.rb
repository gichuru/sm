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

ActiveRecord::Schema.define(version: 20180116082518) do

  create_table "cities", force: :cascade do |t|
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.string   "email"
    t.integer  "phone"
    t.string   "logo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "city_id"
    t.integer  "user_id"
    t.index ["city_id"], name: "index_offices_on_city_id"
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "space_id"
    t.integer  "user_id"
    t.index ["space_id"], name: "index_reviews_on_space_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "type"
    t.text     "description"
    t.integer  "capacity"
    t.integer  "qty"
    t.string   "photo"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "office_id"
    t.index ["office_id"], name: "index_spaces_on_office_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end