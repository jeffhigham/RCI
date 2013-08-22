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

ActiveRecord::Schema.define(version: 20130822002657) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "category"
  end

  create_table "homes", force: true do |t|
    t.string   "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personality_types", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "survey_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_results", force: true do |t|
    t.integer  "survey_id"
    t.integer  "survey_user_id"
    t.integer  "total_E"
    t.integer  "total_I"
    t.integer  "total_S"
    t.integer  "total_N"
    t.integer  "total_T"
    t.integer  "total_F"
    t.integer  "total_J"
    t.integer  "total_P"
    t.text     "survey_answers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "title"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "phone"
    t.string   "personality_type"
    t.boolean  "imported"
    t.string   "ip_address"
    t.string   "user_agent"
    t.string   "zip_code"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "gender"
  end

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
