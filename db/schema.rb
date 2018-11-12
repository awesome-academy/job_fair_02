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

ActiveRecord::Schema.define(version: 2018_11_09_044229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "cv_upload"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_curriculum_vitaes_on_user_id"
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
    t.string "avatar"
    t.integer "founded"
    t.string "form_cv"
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
    t.integer "taggable_id"
    t.string "taggable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
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
