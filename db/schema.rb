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

ActiveRecord::Schema.define(version: 20141001011122) do

  create_table "project_users", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "project_id", null: false
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_users", ["project_id"], name: "index_project_users_on_project_id", using: :btree
  add_index "project_users", ["user_id"], name: "index_project_users_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "purpose"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "security"
    t.integer  "project_type"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nickname",   null: false
    t.string   "mail",       null: false
    t.integer  "device",     null: false
    t.string   "password",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "project_users", "projects", name: "project_users_project_id_fk", dependent: :delete
  add_foreign_key "project_users", "users", name: "project_users_user_id_fk", dependent: :delete

end
