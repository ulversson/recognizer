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

ActiveRecord::Schema.define(version: 2019_07_23_163839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "medico_legal_cases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pipeline_items", force: :cascade do |t|
    t.string "name"
    t.string "arguments"
    t.string "path"
    t.string "command"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.text "result"
  end

  create_table "processing_pipeline_item_files", force: :cascade do |t|
    t.string "input_file_path"
    t.string "output_file_path"
    t.string "output_directory"
    t.integer "processing_pipeline_item_id"
  end

  create_table "processing_pipeline_items", force: :cascade do |t|
    t.integer "processing_pipeline_id"
    t.integer "position"
    t.integer "pipeline_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "processing_pipelines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
  end

  create_table "processing_result_dates", force: :cascade do |t|
    t.datetime "discovered_date"
    t.integer "uploaded_item_id"
  end

  create_table "processing_result_files", force: :cascade do |t|
    t.integer "uploaded_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seed_migration_data_migrations", id: :serial, force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
  end

  create_table "uploaded_items", force: :cascade do |t|
    t.integer "medico_legal_case_id"
    t.string "file_content_type"
    t.string "status", default: "pending", null: false
    t.integer "processing_pipeline_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
