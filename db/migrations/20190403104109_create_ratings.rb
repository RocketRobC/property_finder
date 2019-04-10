Hanami::Model.migration do
  change do
    create_table :ratings do
      primary_key :id

      foreign_key :property_id, :properties, null: false, on_delete: :cascade
      foreign_key :evaluation_criteria_id, :evaluation_criteria, null: false, on_delete: :cascade
      foreign_key :user_id, :users, on_delete: :set_null

      column :value, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
