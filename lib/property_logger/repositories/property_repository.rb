class PropertyRepository < Hanami::Repository
  associations do
    has_many :features, through: :property_features
    has_many :property_features
  end

  def find_with_features(id)
    aggregate(:features).where(id: id).map_to(Property).one
  end

  def find_with_property_features(id)
    aggregate(:property_features).where(id: id).map_to(Property).one
  end

  def create_with_features(data)
    assoc(:property_features).create(data)
  end

  def update_with_features(property, data)
    assoc(:property_features, property).add(data)
  end
end
