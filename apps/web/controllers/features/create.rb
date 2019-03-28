module Web
  module Controllers
    module Features
      class Create
        include Web::Action

        def call(params)
          FeatureRepository.new.create(params[:features])
          redirect_to routes.features_path
        end
      end
    end
  end
end
