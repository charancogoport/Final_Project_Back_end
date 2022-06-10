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

ActiveRecord::Schema[7.0].define(version: 2022_06_09_110752) do
  create_table "likes_cal_tables", force: :cascade do |t|
    t.integer "user_table_id"
    t.integer "post_table_id"
    t.datetime "created_at", precision: nil
    t.boolean "status"
    t.index ["post_table_id"], name: "index_likes_cal_tables_on_post_table_id"
    t.index ["user_table_id"], name: "index_likes_cal_tables_on_user_table_id"
  end

  create_table "post_tables", force: :cascade do |t|
    t.integer "user_table_id"
    t.string "title_of_post"
    t.string "content"
    t.binary "image"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["user_table_id"], name: "index_post_tables_on_user_table_id"
  end

  create_table "user_profile_tables", force: :cascade do |t|
    t.integer "user_table_id"
    t.string "user_description"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.binary "profile_picture"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["user_table_id"], name: "index_user_profile_tables_on_user_table_id"
  end

  create_table "user_tables", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.string "email"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  add_foreign_key "likes_cal_tables", "post_tables"
  add_foreign_key "likes_cal_tables", "user_tables"
  add_foreign_key "post_tables", "user_tables"
  add_foreign_key "user_profile_tables", "user_tables"
end
