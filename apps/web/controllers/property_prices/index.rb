module Web::Controllers::Properties::PropertyPrices
  class Index
    include Web::Action

    expose :price_history, :property

    def call(params)
      @property = PropertyRepository.new.find(params[:property_id])
      @price_history = PropertyPriceRepository.new.for_property(params[:property_id]).order { set_at.desc }
    end
  end
end
