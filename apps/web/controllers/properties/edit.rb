module Web::Controllers::Properties
  class Edit
    include Web::Action

    expose :property, :features

    def call(params)
      @property = PropertyRepository.new.find_with_property_features(params[:id])
      @features = FeatureRepository.new.all
    end
  end
end
