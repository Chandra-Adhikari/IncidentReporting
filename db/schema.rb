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

ActiveRecord::Schema.define(version: 2018_08_17_193839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.string "file"
    t.string "file_type"
    t.string "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incident_details", force: :cascade do |t|
    t.bigint "incident_id"
    t.datetime "incident_date"
    t.text "description"
    t.string "location"
    t.string "reporter_name"
    t.string "reporter_email"
    t.string "reporter_phone"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_incident_details_on_incident_id"
  end

  create_table "incident_observers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.bigint "incident_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_detail_id"], name: "index_incident_observers_on_incident_detail_id"
  end

  create_table "incident_types", force: :cascade do |t|
    t.bigint "incident_id"
    t.bigint "incident_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_detail_id"], name: "index_incident_types_on_incident_detail_id"
    t.index ["incident_id"], name: "index_incident_types_on_incident_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "involved_people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.bigint "incident_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_detail_id"], name: "index_involved_people_on_incident_detail_id"
  end

  create_table "report_incidents", force: :cascade do |t|
    t.text "incident"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "incident_observers", "incident_details"
  add_foreign_key "incident_types", "incident_details"
  add_foreign_key "incident_types", "incidents"
  add_foreign_key "involved_people", "incident_details"
end
