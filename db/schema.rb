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

ActiveRecord::Schema.define(version: 20171122194603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annotations", force: :cascade do |t|
    t.text "annotation"
    t.integer "likes"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "favoritegames", force: :cascade do |t|
    t.string "gid"
    t.string "pgn"
    t.integer "game_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "gid"
    t.integer "white_rating"
    t.integer "black_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "white_id"
    t.integer "black_id"
    t.integer "winner_id"
    t.integer "gametype_id"
    t.index ["gid"], name: "index_games_on_gid", unique: true
  end

  create_table "gametypes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_gametypes_on_name", unique: true
  end

  create_table "players", force: :cascade do |t|
    t.string "pname"
    t.string "country"
    t.integer "BRating"
    t.integer "SRating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pname"], name: "index_players_on_pname", unique: true
  end

  create_table "tournament_games", force: :cascade do |t|
    t.string "tid"
    t.integer "tournament_id"
    t.integer "game_id"
    t.string "gid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "tid"
    t.string "name"
    t.integer "avg_rating"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gametype_id"
    t.integer "first_id"
    t.integer "first_score"
    t.integer "second_id"
    t.integer "second_score"
    t.integer "third_id"
    t.integer "third_score"
    t.index ["tid"], name: "index_tournaments_on_tid", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "player_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
