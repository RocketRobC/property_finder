module Web::Controllers::Properties
  class Create
    include Web::Action

    expose :property

    def call(params)
      if params.valid?
        # feature_params = params[:properties].delete(:property_features)
        @property = PropertyRepository.new
        property = @property.create_with_features(params[:properties])
        feature = PropertyFeatureRepository.new
        redirect_to routes.properties_path
      else
        # TODO
      end
    end
  end
end
