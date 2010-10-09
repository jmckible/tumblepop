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

ActiveRecord::Schema.define(:version => 20101009183151) do

  create_table "asks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asks", ["question_id"], :name => "index_asks_on_question_id"
  add_index "asks", ["secret"], :name => "index_asks_on_secret"
  add_index "asks", ["user_id"], :name => "index_asks_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "permalink"
    t.string   "prompt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["permalink"], :name => "index_questions_on_permalink"

  create_table "stories", :force => true do |t|
    t.integer  "ask_id"
    t.string   "permalink"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["ask_id"], :name => "index_stories_on_ask_id"
  add_index "stories", ["permalink"], :name => "index_stories_on_permalink"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
