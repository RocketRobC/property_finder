Hanami::Model.migration do
  change do
    create_table :property_features do
      primary_key :id

      foreign_key :property_id, :properties, null: false, on_delete: :cascade
      foreign_key :feature_id, :features, null: false, on_delete: :cascade

      column :value, String, null: false
      column :note, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
