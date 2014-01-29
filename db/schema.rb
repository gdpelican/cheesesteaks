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

ActiveRecord::Schema.define(version: 20131125220955) do

  create_table "addresses", force: true do |t|
    t.string  "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.boolean "is_destination", default: true
    t.string  "name"
  end

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "salt"
    t.string   "pass_hash"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "workshop_id"
    t.string   "name"
    t.string   "description"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost",                 default: 0.0
  end

  create_table "directions", force: true do |t|
    t.text     "directions"
    t.integer  "address_id"
    t.integer  "transit_mode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "destination_id"
  end

  create_table "faqs", force: true do |t|
    t.string   "question"
    t.text     "answer",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "featureds", force: true do |t|
    t.integer "workshop_id"
    t.integer "teacher_id"
    t.integer "course_id"
    t.integer "picture_id"
  end

  create_table "links", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.decimal  "amount_owed"
    t.boolean  "paid"
    t.string   "tshirt_type"
    t.string   "tshirt_size"
    t.integer  "address_id"
    t.integer  "workshop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "pictures", force: true do |t|
    t.string   "caption"
    t.integer  "workshop_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transit_modes", force: true do |t|
    t.string "name"
  end

  create_table "workshops", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "address_id"
  end

end
