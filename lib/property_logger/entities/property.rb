class Property < Hanami::Entity
  # attributes do
  #   attribute :id, Types::Int
  #   attribute :description, Types::String
  #   attribute :street_no, Types::String
  #   attribute :street_name, Types::String
  #   attribute :suburb, Types::String
  #   attribute :postcode, Types::String
  #   attribute :created_at, Types::DateTime
  #   attribute :updated_at, Types::DateTime
  #   attribute :notes, Types::String
  #   attribute :land_size, Types::Form::Float
  #   attribute :house_size, Types::Form::Float
  #   attribute :available, Types::Form::Bool
  #   attribute :ratings, Types::Collection()
  #   attribute :features, Types::Collection(Types::Coercible::Hash)
  # end

  def address
    "#{street_no} #{street_name}"
  end

  def address_underscored
    "#{street_no}_#{street_name.downcase.gsub(' ', '_')}"
  end

  def formatted_land_size
    format_m2(land_size)
  end

  def formatted_house_size
    format_m2(house_size)
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
    S3Service.new.object_exists?(address_underscored)
  end

  def ratings_for_user(user_id)
    ratings = RatingRepository.new
    ratings.for_property_and_user(id, user_id)
  end

  def value_for_rating(user_id, evaluation_criteria_id)
    ratings_for_user(user_id).find { |r| r.evaluation_criteria_id == evaluation_criteria_id }&.value
  end

  def has_ratings_for?(user_id)
    !ratings_for_user(user_id).empty?
  end

  # call on property with associated ratings.
  def aggregated_ratings
    PropertyRatingService::RatingData.new(self).data
  end 

  private

  def format_m2(value)
    value.to_s + ' m2'
  end
end
