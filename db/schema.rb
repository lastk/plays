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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130527151302) do

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "remote_cover"
    t.integer  "rate"
    t.text     "review"
    t.string   "state",             :default => "current"
    t.integer  "total_sessions",    :default => 0
    t.date     "started_on"
    t.date     "finished_on"
    t.text     "url"
    t.text     "blurb"
    t.text     "forum_url"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "total_days_played", :default => 0
    t.boolean  "favorite",          :default => false
  end

end
