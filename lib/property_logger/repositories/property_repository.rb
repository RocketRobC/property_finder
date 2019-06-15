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

  def with_ratings
    assoc(:ratings)
  end

  def create_with_features(data)
    assoc(:property_features).create(data)
  end

  def update_with_features(property, data)
    assoc(:property_features, property).add(data)
  end

  def ranked_list
    available.map do |property|
      prop_with_ratings = find_with_ratings(property.id)
      {
        rating: PropertyRatingService::RatingData.new(prop_with_ratings).overall_weighted_rating, 
        address: property.address
      }
    end.sort_by { |p| p[:rating] }.reverse
  end

  def available
    properties.where(available: true).to_a
  end

  def order_by_street_and_availability
    properties.read("SELECT * FROM properties ORDER BY available DESC, street_name ASC")
  end
end
