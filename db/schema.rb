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

ActiveRecord::Schema.define(version: 7) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "politician_teams", force: true do |t|
    t.integer "politician_id"
    t.integer "team_id"
  end

  create_table "politicians", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "middle_name"
    t.string   "suffix"
    t.string   "twitter_id"
    t.string   "facebook_id"
    t.string   "party"
    t.string   "gender"
    t.string   "state"
    t.string   "title"
    t.string   "chamber"
    t.string   "bioguide_id"
    t.integer  "district"
    t.integer  "senate_class"
    t.boolean  "in_office"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "twitter_mentions"
    t.integer  "twitter_follower_increase"
    t.integer  "vote_score"
    t.integer  "bill_score"
    t.integer  "game_number"
    t.integer  "politician_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sunlight_scores", force: true do |t|
    t.string   "activity"
    t.string   "bioguide_id"
    t.string   "sunlight_timestamp"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "email"
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
