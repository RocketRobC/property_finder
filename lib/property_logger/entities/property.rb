class Property < Hanami::Entity
  def address
    "#{street_no} #{street_name}"
  end

  def with_property_feature(id)
    property_features.select { |f| f.feature_id == id }.first
  end

  def with_feature(id)
    pf = with_property_feature(id)
    FeatureRepository.new.find(pf.feature_id)
  end

  def value_for_feature(id)
    with_property_feature(id)&.value
  end

  def note_for_feature(id)
    with_property_feature(id)&.note
  end
end
