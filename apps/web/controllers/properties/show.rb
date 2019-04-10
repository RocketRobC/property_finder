module Web::Controllers::Properties
  class Show
    include Web::Action

    expose :property, :property_features, :evaluation_criteria

    def call(params)
      properties = PropertyRepository.new
      @property = properties.find_with_features(params[:id])
      @property_features = properties.find_with_property_features(params[:id])
      @evaluation_criteria = EvaluationCriteriaRepository.new.all
    end
  end
end
