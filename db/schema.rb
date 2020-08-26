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

ActiveRecord::Schema.define(version: 2020_08_26_031120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "movie_id"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
    t.string "time"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "user_parties", force: :cascade do |t|
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "attendee_id"
    t.bigint "host_id"
    t.index ["attendee_id"], name: "index_user_parties_on_attendee_id"
    t.index ["party_id"], name: "index_user_parties_on_party_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "username"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "refresh_token"
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "parties", "users"
  add_foreign_key "user_parties", "parties"
  add_foreign_key "user_parties", "users", column: "attendee_id"
end
