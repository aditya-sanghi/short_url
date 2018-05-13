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

ActiveRecord::Schema.define(version: 20180513091318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "url_relations", force: :cascade do |t|
    t.string "short_version", null: false
    t.string "full_version", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["full_version"], name: "index_url_relations_on_full_version"
    t.index ["short_version"], name: "index_url_relations_on_short_version"
  end

  create_table "user_requests", force: :cascade do |t|
    t.string "ip"
    t.string "browser_name"
    t.string "browser_version"
    t.string "platform_name"
    t.string "platform_version"
    t.bigint "url_relation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url_relation_id"], name: "index_user_requests_on_url_relation_id"
  end

  add_foreign_key "user_requests", "url_relations"
end
