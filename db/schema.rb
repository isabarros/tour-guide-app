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

ActiveRecord::Schema[7.0].define(version: 2024_11_05_223506) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["sale_id"], name: "index_items_on_sale_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "sales_rep_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_rep_id"], name: "index_sales_on_sales_rep_id"
  end

  create_table "sales_reps", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_sales_reps_on_organization_id"
    t.index ["user_id"], name: "index_sales_reps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "products"
  add_foreign_key "items", "sales"
  add_foreign_key "sales", "sales_reps"
  add_foreign_key "sales_reps", "organizations"
  add_foreign_key "sales_reps", "users"
end
