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

ActiveRecord::Schema.define(version: 20151019165457) do

  create_table "people", force: :cascade do |t|
    t.string "name"
  end

  create_table "people_tasks", id: false, force: :cascade do |t|
    t.integer "task_id"
    t.integer "person_id"
  end

  add_index "people_tasks", ["person_id"], name: "index_people_tasks_on_person_id"
  add_index "people_tasks", ["task_id", "person_id"], name: "index_people_tasks_on_task_id_and_person_id"

  create_table "plannings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "wedding_id"
  end

  add_index "plannings", ["wedding_id"], name: "index_plannings_on_wedding_id"

  create_table "reference_tasks", force: :cascade do |t|
    t.string  "name"
    t.text    "comment"
    t.integer "theme_id"
    t.integer "assigned_person"
    t.integer "wedding_in_more_than_12_months"
    t.integer "wedding_in_12_months"
    t.integer "wedding_in_11_months"
    t.integer "wedding_in_10_months"
    t.integer "wedding_in_9_months"
    t.integer "wedding_in_8_months"
    t.integer "wedding_in_7_months"
    t.integer "wedding_in_6_months"
    t.integer "wedding_in_5_months"
    t.integer "wedding_in_4_months"
    t.integer "wedding_in_3_months"
    t.integer "wedding_in_2_months"
    t.integer "wedding_in_1_month"
  end

  create_table "tasks", force: :cascade do |t|
    t.string  "name"
    t.text    "comment"
    t.integer "planning_id"
    t.boolean "completed",         default: false
    t.integer "theme_id"
    t.integer "period"
    t.integer "reference_task_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "firstname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

  create_table "weddings", force: :cascade do |t|
    t.date    "date"
    t.integer "groom_id"
    t.integer "bride_id"
  end

  add_index "weddings", ["bride_id"], name: "index_weddings_on_bride_id"
  add_index "weddings", ["groom_id"], name: "index_weddings_on_groom_id"

end
