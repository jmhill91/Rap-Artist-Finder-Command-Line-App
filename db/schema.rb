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

ActiveRecord::Schema.define(version: 2019_05_08_232833) do

  create_table "albums", force: :cascade do |t|
    t.string "album_name"
    t.integer "rapper_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.integer "rapper_id"
    t.integer "song_id"
  end

  create_table "rappers", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "gender"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
  end

  create_table "subgenrees", force: :cascade do |t|
    t.string "type"
    t.integer "song_id"
  end

end
