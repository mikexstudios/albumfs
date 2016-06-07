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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110703224823) do

  create_table "album_arts", :force => true do |t|
    t.integer  "album_id"
    t.string   "small"
    t.string   "medium"
    t.string   "large"
    t.string   "extralarge"
    t.string   "mega"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_arts", ["album_id"], :name => "index_album_arts_on_album_id"

  create_table "albums", :force => true do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mbid"
  end

  add_index "albums", ["artist_id"], :name => "index_albums_on_artist_id"

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mbid"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "sources", :force => true do |t|
    t.integer  "album_id"
    t.string   "type"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["album_id"], :name => "index_sources_on_album_id"

  create_table "tracks", :force => true do |t|
    t.integer  "album_id"
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["album_id"], :name => "index_tracks_on_album_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
