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

ActiveRecord::Schema.define(version: 20150315103549) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "mail_templates", force: true do |t|
    t.string   "from"
    t.string   "to"
    t.string   "cc"
    t.string   "bcc"
    t.string   "subject"
    t.string   "header"
    t.string   "body"
    t.string   "footer"
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "goal"
    t.string   "memo"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "security"
    t.integer  "state"
    t.integer  "priority"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "tasks", ["category_id"], name: "index_tasks_on_category_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "nickname",   null: false
    t.string   "mail",       null: false
    t.integer  "device",     null: false
    t.string   "password",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "categories", "users", name: "categories_user_id_fk", dependent: :delete

  add_foreign_key "tasks", "categories", name: "tasks_category_id_fk", dependent: :delete
  add_foreign_key "tasks", "users", name: "tasks_user_id_fk", dependent: :delete

end
