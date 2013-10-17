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

ActiveRecord::Schema.define(version: 20131017030001) do

  create_table "user_friends", force: true do |t|
    t.integer  "user_uid"
    t.integer  "friend_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_friends", ["friend_uid"], name: "index_user_friends_on_friend_uid", using: :btree
  add_index "user_friends", ["user_uid"], name: "index_user_friends_on_user_uid", using: :btree

  create_table "user_impressions", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_impressions", ["user_id"], name: "index_user_impressions_on_user_id", using: :btree

  create_table "user_likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "to_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_likes", ["to_user_id"], name: "index_user_likes_on_to_user_id", using: :btree
  add_index "user_likes", ["user_id"], name: "index_user_likes_on_user_id", using: :btree

  create_table "user_photos", force: true do |t|
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_photos", ["user_id"], name: "index_user_photos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "nick_name"
    t.integer  "country_id"
    t.string   "address"
    t.date     "birthday"
    t.integer  "gender_id"
    t.integer  "occupation_id"
    t.string   "mail"
    t.integer  "uid",               limit: 8
    t.boolean  "friend_allow_flg",                   default: false
    t.boolean  "closed_flg",                         default: false
    t.text     "self_introduction", limit: 16777215
    t.string   "access_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["closed_flg"], name: "index_users_on_closed_flg", using: :btree
  add_index "users", ["country_id"], name: "index_users_on_country_id", using: :btree
  add_index "users", ["friend_allow_flg"], name: "index_users_on_friend_allow_flg", using: :btree
  add_index "users", ["gender_id"], name: "index_users_on_gender_id", using: :btree
  add_index "users", ["oauth_expires_at"], name: "index_users_on_oauth_expires_at", using: :btree
  add_index "users", ["occupation_id"], name: "index_users_on_occupation_id", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
