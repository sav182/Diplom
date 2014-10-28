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

ActiveRecord::Schema.define(version: 20141005192906) do

  create_table "asperities", force: true do |t|
    t.integer  "number"
    t.string   "drawing"
    t.string   "form"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.string   "model"
    t.string   "type_device"
    t.string   "type_poverh"
    t.string   "form_poverh"
    t.float    "cleanliness"
    t.float    "complexity"
    t.integer  "asperity_id"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["asperity_id"], name: "index_devices_on_asperity_id"
  add_index "devices", ["department_id"], name: "index_devices_on_department_id"

  create_table "machines", force: true do |t|
    t.string   "name"
    t.string   "model"
    t.string   "type_machine"
    t.string   "type_poverh"
    t.string   "form_poverh"
    t.float    "cleanliness"
    t.float    "complexity"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "machines", ["department_id"], name: "index_machines_on_department_id"

  create_table "plans", force: true do |t|
    t.integer  "name"
    t.integer  "year"
    t.integer  "product_id"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["product_id"], name: "index_plans_on_product_id"
  add_index "plans", ["section_id"], name: "index_plans_on_section_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "drawing"
    t.string   "inventory_number"
    t.integer  "amount_sections"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["plan_id"], name: "index_products_on_plan_id"

  create_table "sections", force: true do |t|
    t.string   "name"
    t.string   "drawing"
    t.string   "inventory_number"
    t.integer  "product_id"
    t.integer  "asperity_id"
    t.integer  "machine_id"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["asperity_id"], name: "index_sections_on_asperity_id"
  add_index "sections", ["machine_id"], name: "index_sections_on_machine_id"
  add_index "sections", ["plan_id"], name: "index_sections_on_plan_id"
  add_index "sections", ["product_id"], name: "index_sections_on_product_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
