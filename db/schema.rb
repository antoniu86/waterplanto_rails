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

ActiveRecord::Schema.define(version: 2021_06_29_082258) do

  create_table "alexa_login_keys", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "login_key", limit: 10, null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login_key"], name: "index_alexa_login_keys_on_login_key", unique: true
    t.index ["user_id"], name: "index_alexa_login_keys_on_user_id", unique: true
  end

  create_table "alexa_tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "authentication", null: false
    t.string "access"
    t.string "refresh"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authentication"], name: "index_alexa_tokens_on_authentication", unique: true
    t.index ["user_id"], name: "index_alexa_tokens_on_user_id", unique: true
  end

  create_table "devices", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.string "code"
    t.integer "status", default: 0, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "network_id"
    t.float "humidity", default: 0.0, null: false
    t.integer "level", default: 0
    t.float "temperature", default: 0.0, null: false
    t.boolean "water", default: false
    t.datetime "watered_at"
    t.integer "water_at", default: 20
    t.integer "soil", default: 0
    t.integer "duration", default: 5, null: false
    t.index ["network_id"], name: "index_devices_on_network_id"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "device_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_logs_on_device_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "networks", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "password", limit: 20, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.string "ssid", limit: 20, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "last_login", default: "2021-06-06 14:49:34", null: false
    t.string "username"
    t.boolean "public_profile", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
