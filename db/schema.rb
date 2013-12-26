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

ActiveRecord::Schema.define(version: 20131226115728) do

  create_table "set_list_to_songs", force: true do |t|
    t.integer  "set_list_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "set_list_to_songs", ["set_list_id"], name: "index_set_list_to_songs_on_set_list_id"
  add_index "set_list_to_songs", ["song_id"], name: "index_set_list_to_songs_on_song_id"

  create_table "set_lists", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "key"
    t.string   "raw_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
