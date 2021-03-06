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

ActiveRecord::Schema.define(:version => 20110302053757) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookmarks", :force => true do |t|
    t.string   "description"
    t.string   "permalink"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "subtitle"
    t.string   "author",      :null => false
    t.date     "finished_at", :null => false
    t.integer  "rating"
    t.text     "review"
    t.text     "synopsis"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "fact_stats", :force => true do |t|
    t.string   "last_category_name"
    t.string   "last_category_slug"
    t.integer  "last_fact_id"
    t.string   "facts_by_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "thumbnail_url"
    t.string   "permalink"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.string   "content"
    t.string   "permalink"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
