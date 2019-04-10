Hanami::Model.migration do
  change do
    create_table :evaluation_criteria do
      primary_key :id

      column :name, String, null: false
      column :description, String
      column :weight, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
