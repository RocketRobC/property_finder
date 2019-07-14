Hanami::Model.migration do
  change do
    create_table :financial_data do
      primary_key :id

      column :total_funds_in_dollars, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
