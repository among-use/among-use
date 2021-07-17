ActiveRecord::Schema.define(version: 2021_07_17_040955) do

  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "message"
    t.datetime "start_datetime"
    t.datetime "finish_datetime"
    t.string "rule"
    t.integer "max_crews"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
