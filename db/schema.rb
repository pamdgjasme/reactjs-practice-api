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

ActiveRecord::Schema[7.0].define(version: 2023_07_20_120511) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_photos", force: :cascade do |t|
    t.jsonb "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_data"], name: "index_booking_photos_on_image_data"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "listing_id"
    t.date "date_from"
    t.date "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
  end

  create_table "listing_photos", force: :cascade do |t|
    t.bigint "listing_id"
    t.jsonb "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_data"], name: "index_listing_photos_on_image_data"
    t.index ["listing_id"], name: "index_listing_photos_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.string "grade"
    t.decimal "fees", precision: 8, scale: 2
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end