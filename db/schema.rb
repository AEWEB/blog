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

ActiveRecord::Schema.define(version: 20141103123647) do

  create_table "levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_task_categories", force: true do |t|
    t.integer  "project_id",       null: false
    t.integer  "task_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_task_categories", ["project_id"], name: "index_project_task_categories_on_project_id", using: :btree
  add_index "project_task_categories", ["task_category_id"], name: "index_project_task_categories_on_task_category_id", using: :btree

  create_table "project_tasks", force: true do |t|
    t.integer  "project_id", null: false
    t.integer  "task_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_tasks", ["project_id"], name: "index_project_tasks_on_project_id", using: :btree
  add_index "project_tasks", ["task_id"], name: "index_project_tasks_on_task_id", using: :btree

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

  create_table "task_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "ta_name"
    t.string   "ta_goal"
    t.string   "ta_memo"
    t.datetime "ta_start_time"
    t.datetime "ta_end_time"
    t.string   "ta_security"
    t.string   "ta_status"
    t.string   "ta_priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_task_category_id", null: false
  end

  add_index "tasks", ["project_task_category_id"], name: "tasks_project_task_category_id_fk", using: :btree

  create_table "users", force: true do |t|
    t.string   "nickname",   null: false
    t.string   "mail",       null: false
    t.integer  "device",     null: false
    t.string   "password",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "project_task_categories", "projects", name: "project_task_categories_project_id_fk", dependent: :delete
  add_foreign_key "project_task_categories", "task_categories", name: "project_task_categories_task_category_id_fk", dependent: :delete

  add_foreign_key "project_tasks", "projects", name: "project_tasks_project_id_fk", dependent: :delete
  add_foreign_key "project_tasks", "tasks", name: "project_tasks_task_id_fk", dependent: :delete

  add_foreign_key "project_users", "projects", name: "project_users_project_id_fk", dependent: :delete
  add_foreign_key "project_users", "users", name: "project_users_user_id_fk", dependent: :delete

  add_foreign_key "tasks", "project_task_categories", name: "tasks_project_task_category_id_fk"

end
