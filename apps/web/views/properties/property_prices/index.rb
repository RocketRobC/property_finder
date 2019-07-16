module Web::Views::Properties::PropertyPrices
  class Index
    include Web::View

    def title
      'Price History for ' + property.address
    end

    def formatted_amount(amount)
      format_dollars(amount)
    end

    private

    def format_dollars(amount)
      '$' + format_number(amount)
    end
  end
end
