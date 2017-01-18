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

ActiveRecord::Schema.define(version: 20170118154822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string  "title"
    t.integer "status"
  end

  create_table "movies_oscar_categories", id: false, force: :cascade do |t|
    t.integer "movie_id",          null: false
    t.integer "oscar_category_id", null: false
    t.index ["movie_id", "oscar_category_id"], name: "index_movies_oscar_categories_on_movie_id_and_oscar_category_id", using: :btree
    t.index ["oscar_category_id", "movie_id"], name: "index_movies_oscar_categories_on_oscar_category_id_and_movie_id", using: :btree
  end

  create_table "movies_theaters", id: false, force: :cascade do |t|
    t.integer "movie_id",                null: false
    t.integer "theater_id",              null: false
    t.integer "date_times", default: [],              array: true
    t.index ["movie_id", "theater_id"], name: "index_movies_theaters_on_movie_id_and_theater_id", using: :btree
    t.index ["theater_id", "movie_id"], name: "index_movies_theaters_on_theater_id_and_movie_id", using: :btree
  end

  create_table "oscar_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

end
