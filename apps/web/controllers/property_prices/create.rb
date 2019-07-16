module Web::Controllers::Properties::PropertyPrices
  class Create
    include Web::Action

    params do
      required(:property_prices).schema do
        required(:amount_in_dollars).filled
        required(:set_at).filled
        required(:type).filled
      end
      required(:property_id).filled
    end

    def call(params)
      if params.valid?
        repo = PropertyPriceRepository.new
        repo.create(create_params)
        redirect_to routes.property_prices_path(property_id: params[:property_id])
      else
        puts '*!*!*!*!'
        # TODO
      end
    end

    def create_params
      params[:property_prices].merge(property_id: params[:property_id])
    end
  end
end

