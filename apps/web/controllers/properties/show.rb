module Web::Controllers::Properties
  class Show
    include Web::Action

    expose :property, :property_features, :evaluation_criteria, :rating_data

    def call(params)
      properties = PropertyRepository.new
      property_with_ratings = properties.find_with_ratings(params[:id])
      @property = properties.find_with_features(params[:id])
      @property_features = properties.find_with_property_features(params[:id])
      @evaluation_criteria = EvaluationCriteriaRepository.new.all
      @rating_data = PropertyRatingService::RatingData.new(property_with_ratings).data
    end
  end
end
