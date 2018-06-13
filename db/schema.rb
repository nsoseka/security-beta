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

ActiveRecord::Schema.define(version: 2018_06_13_014858) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "agents", force: :cascade do |t|
    t.string "role"
    t.string "username"
    t.integer "id_card_number"
    t.string "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "station_id"
    t.string "full_name"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
    t.boolean "verification_status", default: false
    t.boolean "email_verification_status", default: true
    t.string "password_confirmation"
  end

  create_table "archives", force: :cascade do |t|
    t.string "archive_type"
    t.integer "archive_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "agent_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.string "surname"
    t.string "given_names"
    t.date "date_of_birth"
    t.string "father"
    t.string "mother"
    t.string "occupation"
    t.string "address"
    t.decimal "height", precision: 10, scale: 2
    t.string "sex"
    t.string "sp"
    t.integer "id_card_number"
    t.date "date_issued"
    t.date "expiry_date"
    t.string "passport_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "born_at"
    t.string "telephone"
  end

  create_table "convictions", force: :cascade do |t|
    t.text "charge"
    t.text "sentence"
    t.string "judge"
    t.integer "agent_id"
    t.integer "citizen_id"
    t.integer "court_id"
    t.date "sentenced_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "convocations", force: :cascade do |t|
    t.text "reason"
    t.date "date_expected"
    t.integer "citizen_id"
    t.integer "convoker_id"
    t.integer "station_id"
    t.integer "agent_id"
    t.boolean "status", default: false
    t.boolean "honor_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "convocations_updates", force: :cascade do |t|
    t.integer "convocation_id"
    t.integer "agent_id"
    t.string "description"
    t.boolean "old_value"
    t.boolean "new_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flags", force: :cascade do |t|
    t.text "reason"
    t.integer "citizen_id"
    t.integer "agent_id"
    t.integer "station_id"
    t.integer "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "remove", default: false
  end

  create_table "flags_updates", force: :cascade do |t|
    t.integer "flag_id"
    t.integer "agent_id"
    t.string "description"
    t.boolean "old_value"
    t.boolean "new_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restrictions", force: :cascade do |t|
    t.string "genre"
    t.text "description"
    t.integer "agent_id"
    t.integer "citizen_id"
    t.integer "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "remove", default: false
  end

  create_table "restrictions_updates", force: :cascade do |t|
    t.integer "restriction_id"
    t.integer "agent_id"
    t.string "description"
    t.boolean "old_value"
    t.boolean "new_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "region_id"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
