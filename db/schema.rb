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

ActiveRecord::Schema.define(version: 2020_04_23_221835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assesments", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.string "distractor_1"
    t.string "distractor_2"
    t.string "distractor_3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "credit_number"
    t.text "content"
    t.string "upload_file"
    t.string "course_price"
    t.string "status"
    t.string "marks"
    t.string "attempty"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "marks"
    t.string "attempty"
    t.bigint "course_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_exams_on_course_id"
    t.index ["users_id"], name: "index_exams_on_users_id"
  end

  create_table "mc_questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.string "distractor_1"
    t.string "distractor_2"
    t.string "distractor_3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "quiz_id"
    t.index ["quiz_id"], name: "index_mc_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "correct"
    t.integer "possible"
    t.integer "answer"
    t.integer "distract"
    t.bigint "assesments_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "score"
    t.integer "marks"
    t.index ["assesments_id"], name: "index_results_on_assesments_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.integer "clearance"
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "ip_address"
    t.string "salt"
    t.string "hashed_password"
    t.boolean "activated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "courses", "users"
  add_foreign_key "exams", "courses"
  add_foreign_key "exams", "users", column: "users_id"
  add_foreign_key "mc_questions", "quizzes"
  add_foreign_key "results", "assesments", column: "assesments_id"
end
