Hanami::Model.migration do
  change do
    create_table :properties do
      primary_key :id

      column :description, String, null: false
      column :notes, String
      column :street_no, String, null: false
      column :street_name, String, null: false
      column :suburb, String, null: false
      column :postcode, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
