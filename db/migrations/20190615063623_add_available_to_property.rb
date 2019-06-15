Hanami::Model.migration do
  change do
    add_column :properties, :available, TrueClass, null: false, default: false
  end
end
