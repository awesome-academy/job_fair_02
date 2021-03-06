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

ActiveRecord::Schema.define(version: 2018_11_19_015846) do

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

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curriculum_vitae_details", force: :cascade do |t|
    t.bigint "curriculum_vitae_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitae_details_on_curriculum_vitae_id"
  end

  create_table "curriculum_vitae_jobs", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "curriculum_vitae_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_vitae_id"], name: "index_curriculum_vitae_jobs_on_curriculum_vitae_id"
    t.index ["job_id"], name: "index_curriculum_vitae_jobs_on_job_id"
  end

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "industry"
    t.text "target"
    t.string "experience"
    t.string "skill"
    t.string "language"
    t.string "cv_upload_file_name"
    t.string "cv_upload_content_type"
    t.integer "cv_upload_file_size"
    t.datetime "cv_upload_updated_at"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_curriculum_vitaes_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.string "follower_type", null: false
    t.bigint "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "career_id"
    t.bigint "organization_id"
    t.bigint "province_id"
    t.string "title"
    t.integer "age_from"
    t.integer "age_to"
    t.string "skill"
    t.integer "salary"
    t.string "work_address"
    t.string "employment_type"
    t.string "level"
    t.text "description"
    t.string "experience"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_jobs_on_career_id"
    t.index ["organization_id"], name: "index_jobs_on_organization_id"
    t.index ["province_id"], name: "index_jobs_on_province_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "target_type"
    t.integer "target_id"
    t.string "content"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "organization_users", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "user_id"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_users_on_organization_id"
    t.index ["user_id"], name: "index_organization_users_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "website"
    t.string "scales"
    t.text "description"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "founded"
    t.string "form_cv_file_name"
    t.string "form_cv_content_type"
    t.integer "form_cv_file_size"
    t.datetime "form_cv_updated_at"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.integer "gender"
    t.string "phone"
    t.string "address"
    t.string "avatar"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "curriculum_vitae_details", "curriculum_vitaes"
  add_foreign_key "curriculum_vitae_jobs", "curriculum_vitaes"
  add_foreign_key "curriculum_vitae_jobs", "jobs"
  add_foreign_key "curriculum_vitaes", "users"
  add_foreign_key "jobs", "careers"
  add_foreign_key "jobs", "organizations"
  add_foreign_key "jobs", "provinces"
  add_foreign_key "notifications", "users"
  add_foreign_key "organization_users", "organizations"
  add_foreign_key "organization_users", "users"
  add_foreign_key "taggings", "tags"
end
