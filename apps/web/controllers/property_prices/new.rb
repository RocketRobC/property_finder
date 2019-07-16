module Web::Controllers::Properties::PropertyPrices
  class New
    include Web::Action

    expose :property

    def call(params)
      @property = PropertyRepository.new.find(params[:property_id])
    end
  end
end
