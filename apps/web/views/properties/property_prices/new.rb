module Web::Views::Properties::PropertyPrices
  class New
    include Web::View

    def types
      PropertyPrice::TYPES
    end
  end
end
