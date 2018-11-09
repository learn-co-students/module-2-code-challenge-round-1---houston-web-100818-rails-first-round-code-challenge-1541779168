ActiveRecord::Schema.define(version: 20170725185638) do

  create_table "heroines", force: :cascade do |t|
    t.string "name"
    t.string "super_name"
    t.integer "power_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["power_id"], name: "index_heroines_on_power_id"
  end

  create_table "powers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
