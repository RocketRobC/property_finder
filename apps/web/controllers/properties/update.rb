module Web::Controllers::Properties
  class Update
    include Web::Action

    def call(params)
      repo = PropertyRepository.new
      property = repo.find_with_features(params[:id])
      repo.update(params[:id], params[:property])
      params[:property][:property_features].each do |pf|
        PropertyFeatureRepository.new.
          create_or_update(property.id, pf[:feature_id], pf)
      end
      redirect_to routes.property_path(params[:id])
    end
  end
end
