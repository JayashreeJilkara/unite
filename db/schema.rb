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

ActiveRecord::Schema.define(version: 20160824125707) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "institute_id"
    t.string   "pin_code",     limit: 20,    null: false
    t.string   "city",                       null: false
    t.string   "phone_number",               null: false
    t.text     "address",      limit: 65535, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["institute_id"], name: "fk_rails_5ee23b3b59", using: :btree
    t.index ["user_id"], name: "fk_rails_48c9e0c5a2", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "institute_id"
    t.string   "course_name"
    t.integer  "fee_structure"
    t.string   "duration"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["institute_id"], name: "fk_rails_262e8e92c4", using: :btree
  end

  create_table "distributables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "institute_id"
    t.string   "file_name"
    t.string   "file_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["institute_id"], name: "fk_rails_1cdec52c64", using: :btree
  end

  create_table "institutes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "image"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "fk_rails_4c91ef4817", using: :btree
  end

  create_table "review_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["review_id"], name: "fk_rails_bc51f601d8", using: :btree
    t.index ["user_id"], name: "fk_rails_103f070a26", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "institute_id"
    t.string   "rating"
    t.text     "review_comment", limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["institute_id"], name: "fk_rails_77e3c394f7", using: :btree
    t.index ["user_id"], name: "fk_rails_74a66bd6c5", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",                                           null: false
    t.string   "last_name",                                            null: false
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.boolean  "is_admin",                             default: false
    t.text     "occupation",             limit: 65535
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "institutes"
  add_foreign_key "addresses", "users"
  add_foreign_key "courses", "institutes"
  add_foreign_key "distributables", "institutes"
  add_foreign_key "institutes", "users"
  add_foreign_key "review_responses", "reviews"
  add_foreign_key "review_responses", "users"
  add_foreign_key "reviews", "institutes"
  add_foreign_key "reviews", "users"
end
