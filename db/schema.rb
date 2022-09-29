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

ActiveRecord::Schema.define(version: 2022_09_21_140557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expense_debts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "expense_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_expense_debts_on_expense_id"
    t.index ["user_id"], name: "index_expense_debts_on_user_id"
  end

  create_table "expense_payments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "expense_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_expense_payments_on_expense_id"
    t.index ["user_id"], name: "index_expense_payments_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "title"
    t.integer "total"
    t.datetime "date_time"
    t.string "description"
    t.string "expenseable_type"
    t.bigint "expenseable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expenseable_type", "expenseable_id"], name: "index_expenses_on_expenseable"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "group_type"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_groups_on_owner_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "phone_number"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
