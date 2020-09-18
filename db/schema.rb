# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_18_083230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "performance_id", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["performance_id"], name: "index_comments_on_performance_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "event_name", limit: 255, null: false
    t.text "event_description", null: false
    t.string "event_attachment", null: false
    t.datetime "published_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "performances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.string "title", limit: 255, null: false
    t.text "description"
    t.string "attchment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_performances_on_event_id"
    t.index ["user_id"], name: "index_performances_on_user_id"
  end

  create_table "performers", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_performers_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.string "mobile", limit: 10, null: false
    t.boolean "admin"
    t.string "password_digest", null: false
    t.string "auth_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "performances"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "performances", "events"
  add_foreign_key "performances", "users"
  add_foreign_key "performers", "events"
end
