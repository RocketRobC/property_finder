module Web::Views::Properties
  class Index
    include Web::View

    def property_rating(property)
      prop_with_ratings = PropertyRepository.new.find_with_ratings(property.id)
      PropertyRatingService::RatingData.new(prop_with_ratings).overall_weighted_rating
    end
  end
end
