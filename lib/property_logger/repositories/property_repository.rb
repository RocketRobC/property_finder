class PropertyRepository < Hanami::Repository
  associations do
    has_many :features, through: :property_features
    has_many :property_features
    has_many :evaluation_criteria, through: :ratings
    has_many :ratings
  end

  def find_with_features(id)
    aggregate(:features).where(id: id).map_to(Property).one
  end

  def find_with_property_features(id)
    aggregate(:property_features).where(id: id).map_to(Property).one
  end

  def find_with_ratings(id)
    aggregate(:ratings).where(id: id).map_to(Property).one
  end

  def create_with_features(data)
    assoc(:property_features).create(data)
  end

  def update_with_features(property, data)
    assoc(:property_features, property).add(data)
  end
end
