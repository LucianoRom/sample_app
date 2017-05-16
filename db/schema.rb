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

ActiveRecord::Schema.define(version: 20170516133519) do

  create_table "ages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ambiances", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apis", force: :cascade do |t|
    t.string   "api_name"
    t.string   "apicture"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
    t.index ["api_name"], name: "index_apis_on_api_name", unique: true
  end

  create_table "complexites", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "durees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "complexite_id"
    t.integer  "duree_id"
    t.integer  "user_id"
    t.index ["complexite_id"], name: "index_games_on_complexite_id"
    t.index ["duree_id"], name: "index_games_on_duree_id"
    t.index ["name", "user_id"], name: "index_games_on_name_and_user_id"
    t.index ["name"], name: "index_games_on_name"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "jeu_ages", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "age_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_id"], name: "index_jeu_ages_on_age_id"
    t.index ["game_id"], name: "index_jeu_ages_on_game_id"
  end

  create_table "jeu_ambiances", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "ambiance_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["ambiance_id"], name: "index_jeu_ambiances_on_ambiance_id"
    t.index ["game_id"], name: "index_jeu_ambiances_on_game_id"
  end

  create_table "jeu_nbjoueurs", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "nbjoueur_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["game_id"], name: "index_jeu_nbjoueurs_on_game_id"
    t.index ["nbjoueur_id"], name: "index_jeu_nbjoueurs_on_nbjoueur_id"
  end

  create_table "jeu_styles", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_jeu_styles_on_game_id"
    t.index ["style_id"], name: "index_jeu_styles_on_style_id"
  end

  create_table "jeu_thematiques", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "thematique_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["game_id"], name: "index_jeu_thematiques_on_game_id"
    t.index ["thematique_id"], name: "index_jeu_thematiques_on_thematique_id"
  end

  create_table "jeu_versions", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_jeu_versions_on_game_id"
    t.index ["version_id"], name: "index_jeu_versions_on_version_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "nbjoueurs", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thematiques", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "updates", force: :cascade do |t|
    t.text     "detail"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
