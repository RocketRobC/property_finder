Hanami::Model.migration do
  change do
    add_column :properties, :land_size, Float
    add_column :properties, :house_size, Float
  end
end
