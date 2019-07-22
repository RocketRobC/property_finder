module ValueCalculationService
  class LandValueCalculator
    def initialize(property, price = PropertyPriceRepository.new)
      @property = property
      @price_repo = price
    end

    def per_square_meter
      return 0 if property_price.zero? || property.land_size.nil?
      property_price / property.land_size
    end

    private

    attr_reader :property, :price_repo

    def property_price
      return 0 if price_entity.nil?
      price_entity.amount_in_dollars
    end

    def price_entity
      @price ||= price_repo.current_for_property(property.id)
    end
  end
end
