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

ActiveRecord::Schema[7.0].define(version: 2023_06_23_121546) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "culture_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "culture_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "culture_tests", force: :cascade do |t|
    t.string "test_type"
    t.integer "respondent_id"
    t.integer "answer_one"
    t.integer "answer_two"
    t.integer "answer_three"
    t.integer "answer_four"
    t.integer "answer_five"
    t.integer "answer_six"
    t.integer "answer_seven"
    t.integer "answer_eight"
    t.integer "result"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "culture_types", force: :cascade do |t|
    t.string "name"
    t.integer "lower_end"
    t.integer "upper_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
