module Web
  module Controllers
    module Features
      class Index
        include Web::Action

        expose :features

        def call(params)
          @features = FeatureRepository.new.all
        end
      end
    end
  end
end
