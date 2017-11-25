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

ActiveRecord::Schema.define(version: 20171122210754) do

  create_table "setlist_shows", force: :cascade do |t|
    t.integer "setlist_id"
    t.integer "show_id"
  end

  create_table "setlists", force: :cascade do |t|
    t.string "set1"
    t.string "set2"
    t.string "set3"
    t.string "set4"
    t.string "encore"
    t.string "soundcheck"
  end

  create_table "shows", force: :cascade do |t|
    t.string "venue"
    t.string "city"
    t.date "date"
    t.string "notes"
    t.string "jams"
    t.string "tour"
    t.integer "tour_id"
    t.string "date_string"
    t.float "rating"
    t.integer "year"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "original_artist"
    t.date "debut_date"
    t.integer "times_played"
    t.date "last_played"
    t.integer "gap"
    t.string "aka"
    t.text "history"
    t.text "lyrics"
    t.string "musandlyr"
    t.string "vocals"
    t.string "original_album"
    t.string "link"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "num_shows"
    t.string "link"
  end

  create_table "user_shows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "show_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
