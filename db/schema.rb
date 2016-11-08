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

ActiveRecord::Schema.define(version: 20161108063231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_notes", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "user_id"
    t.text     "note",                         null: false
    t.boolean  "privacy",      default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["character_id", "user_id"], name: "index_character_notes_on_character_id_and_user_id", using: :btree
    t.index ["character_id"], name: "index_character_notes_on_character_id", using: :btree
    t.index ["user_id"], name: "index_character_notes_on_user_id", using: :btree
  end

  create_table "characters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "guild_id"
    t.string   "name",                     null: false
    t.integer  "guild_rank",  default: 0
    t.text     "description", default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["game_id"], name: "index_characters_on_game_id", using: :btree
    t.index ["user_id", "game_id"], name: "index_characters_on_user_id_and_game_id", using: :btree
    t.index ["user_id"], name: "index_characters_on_user_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_games_on_title", using: :btree
  end

  create_table "guilds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.string   "title",                    null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "description", default: ""
    t.text     "emblem_link", default: ""
    t.index ["game_id"], name: "index_guilds_on_game_id", using: :btree
    t.index ["title"], name: "index_guilds_on_title", using: :btree
    t.index ["user_id"], name: "index_guilds_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "premium",                default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "character_notes", "characters"
  add_foreign_key "character_notes", "users"
  add_foreign_key "characters", "games"
  add_foreign_key "characters", "users"
  add_foreign_key "guilds", "games"
  add_foreign_key "guilds", "users"
end
