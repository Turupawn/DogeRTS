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

ActiveRecord::Schema.define(version: 20140225030041) do

  create_table "much_withdraws", force: true do |t|
    t.integer  "building_id"
    t.datetime "such_date"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: true do |t|
    t.integer  "num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "energy",           default: 1000
    t.integer  "units",            default: 0
    t.decimal  "doge_spent",       default: 0.0
    t.integer  "damage_dealt",     default: 0
  end

  create_table "very_buildings", force: true do |t|
    t.integer  "user_id"
    t.string   "such_type"
    t.integer  "position"
    t.integer  "hp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "very_loots", force: true do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.datetime "such_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
