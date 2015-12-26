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

ActiveRecord::Schema.define(version: 1) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "observations", force: :cascade do |t|
    t.integer  "projects_id"
    t.string   "text_data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "observations", ["projects_id"], name: "index_observations_on_projects_id", using: :btree

  create_table "observations_classifications", force: :cascade do |t|
    t.integer  "observations_id"
    t.integer  "projects_choices_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "observations_classifications", ["observations_id"], name: "index_observations_classifications_on_observations_id", using: :btree
  add_index "observations_classifications", ["projects_choices_id"], name: "index_observations_classifications_on_projects_choices_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_choices", force: :cascade do |t|
    t.integer  "projects_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects_choices", ["projects_id"], name: "index_projects_choices_on_projects_id", using: :btree

end
