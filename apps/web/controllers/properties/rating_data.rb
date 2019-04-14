module Web::Controllers::Properties
  class RatingData
    include Web::Action

    def call(params)
      property_repo = PropertyRepository.new
      property_with_ratings = property_repo.find_with_ratings(params[:property_id])
      rating_data = PropertyRatingService::RatingData.new(property_with_ratings).data
      self.body = rating_data.to_json
    end
  end
end
