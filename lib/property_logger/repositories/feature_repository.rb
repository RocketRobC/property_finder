class FeatureRepository < Hanami::Repository
  associations do
    has_many :properties, through: :property_features
  end
end
