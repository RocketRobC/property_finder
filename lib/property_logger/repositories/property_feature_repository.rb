class PropertyFeatureRepository < Hanami::Repository
  associations do
    belongs_to :feature
    belongs_to :property
  end

  def find_with_feature(id)
    aggregate(:feature).where(id: id).map_to(PropertyFeature).one
  end

  def find_with_property(id)
    aggregate(:property).where(id: id).map_to(PropertyFeature).one
  end

  def with_property_and_feature(property, feature)
    property_features.
      where(property_id: property).
      where(feature_id: feature).
      first
  end

  def create_or_update(property, feature, data)
    record = with_property_and_feature(property, feature)
    if record
      update(record.id, data)
    else
      create(data)
    end
  end
end
