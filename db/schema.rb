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

ActiveRecord::Schema.define(version: 2019_02_28_102031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nugget_tags", force: :cascade do |t|
    t.bigint "nugget_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nugget_id"], name: "index_nugget_tags_on_nugget_id"
    t.index ["tag_id"], name: "index_nugget_tags_on_tag_id"
  end

  create_table "nuggets", force: :cascade do |t|
    t.string "title"
    t.string "img_url"
    t.string "video_url"
    t.string "question"
    t.text "body"
    t.bigint "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme_id"], name: "index_nuggets_on_theme_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.bigint "workspace_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workspace_id"], name: "index_themes_on_workspace_id"
  end

  create_table "user_nuggets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "nugget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["nugget_id"], name: "index_user_nuggets_on_nugget_id"
    t.index ["user_id"], name: "index_user_nuggets_on_user_id"
  end

  create_table "user_workspaces", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "workspace_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_workspaces_on_user_id"
    t.index ["workspace_id"], name: "index_user_workspaces_on_workspace_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "avatar"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "nugget_tags", "nuggets"
  add_foreign_key "nugget_tags", "tags"
  add_foreign_key "nuggets", "themes"
  add_foreign_key "themes", "workspaces"
  add_foreign_key "user_nuggets", "nuggets"
  add_foreign_key "user_nuggets", "users"
  add_foreign_key "user_workspaces", "users"
  add_foreign_key "user_workspaces", "workspaces"
end
