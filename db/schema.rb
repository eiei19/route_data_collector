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

ActiveRecord::Schema.define(version: 20150223024335) do

  create_table "routes", force: :cascade do |t|
    t.string   "from",       limit: 255
    t.string   "to",         limit: 255
    t.integer  "minutes1",   limit: 4
    t.integer  "transfers1", limit: 4
    t.integer  "minutes2",   limit: 4
    t.integer  "transfers2", limit: 4
    t.integer  "minutes3",   limit: 4
    t.integer  "transfers3", limit: 4
    t.integer  "minutes4",   limit: 4
    t.integer  "transfers4", limit: 4
    t.integer  "minutes5",   limit: 4
    t.integer  "transfers5", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "routes", ["from", "to"], name: "index_routes_on_from_and_to", using: :btree
  add_index "routes", ["from"], name: "index_routes_on_from", using: :btree
  add_index "routes", ["to", "from"], name: "index_routes_on_to_and_from", using: :btree
  add_index "routes", ["to"], name: "index_routes_on_to", using: :btree

end
