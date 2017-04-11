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

ActiveRecord::Schema.define(version: 20170411052223) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "salt"
    t.string   "public_key"
    t.string   "private_key"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string   "card_number"
    t.string   "expiration_month"
    t.string   "expiration_year"
    t.string   "secure_code"
    t.string   "card_token"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "charges", force: :cascade do |t|
    t.string   "amount"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_charges_on_card_id"
  end

end
