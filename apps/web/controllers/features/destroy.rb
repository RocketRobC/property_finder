module Web::Controllers::Features
  class Destroy
    include Web::Action

    def call(params)
      repo = FeatureRepository.new
      repo.delete(params[:id])
      redirect_to routes.features_path
    end
  end
end


