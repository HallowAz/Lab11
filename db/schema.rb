
ActiveRecord::Schema[7.0].define(version: 2022_12_17_150241) do
  create_table "results", force: :cascade do |t|
    t.integer "number"
    t.text "arr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_results_on_number", unique: true
  end

end
