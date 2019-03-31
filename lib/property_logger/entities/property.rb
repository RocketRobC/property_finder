class Property < Hanami::Entity
  def address
    "#{street_no} #{street_name}"
  end

  def address_underscored
    "#{street_no}_#{street_name.downcase.sub(' ', '_')}"
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

  def get_map
    data = { number: street_no, street: street_name,
             suburb: suburb, postcode: postcode }
    MapService.new(data).request_image
  end

  def has_saved_map?
    File.exists?(File.join(Hanami.root, 'apps', 'web',
      'assets', 'images',
      "#{address_underscored}.jpg"))
  end
end
