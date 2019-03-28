module Web::Controllers::Properties
  class New
    include Web::Action

    expose :features, :property_features

    def call(params)
      @features = FeatureRepository.new.all
      @property_features = PropertyFeatureRepository.new.all
    end
  end
end
