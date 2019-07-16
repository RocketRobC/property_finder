Hanami::Model.migration do
  change do
    create_table :property_prices do
      primary_key :id

      foreign_key :property_id, :properties, null: false, on_delete: :cascade

      column :amount_in_dollars, Integer, null: false
      column :type, String, null: false
      column :set_at, DateTime, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
