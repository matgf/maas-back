# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_12_150836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "engineers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["service_id"], name: "index_engineers_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shift_engineers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "engineer_id"
    t.bigint "shift_id", null: false
    t.index ["engineer_id"], name: "index_shift_engineers_on_engineer_id"
    t.index ["shift_id"], name: "index_shift_engineers_on_shift_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.boolean "assigned", default: false
    t.time "start_time"
    t.time "end_time"
    t.bigint "service_id", null: false
    t.index ["service_id"], name: "index_shifts_on_service_id"
  end

  add_foreign_key "engineers", "services"
  add_foreign_key "shift_engineers", "engineers"
  add_foreign_key "shift_engineers", "shifts"
  add_foreign_key "shifts", "services"
end
