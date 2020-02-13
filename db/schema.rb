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

ActiveRecord::Schema.define(version: 2020_02_13_105750) do

# Could not dump table "dogs" because of following StandardError
#   Unknown type 'strings' for column 'appearance'

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "timestamps"
    t.string "phone"
    t.string "address"
    t.string "apartment_number"
    t.string "email"
    t.string "zip_code"
    t.string "door_code"
    t.string "lockbox_code"
    t.string "entry_instructions"
    t.string "instructions"
    t.string "neighborhood"
    t.string "phone2"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
  end

  create_table "walks", force: :cascade do |t|
    t.datetime "window_start"
    t.datetime "window_end"
    t.integer "user_id"
    t.integer "dog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "notes"
    t.string "duration"
    t.datetime "date"
  end

end
