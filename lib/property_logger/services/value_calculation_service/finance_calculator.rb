module ValueCalculationService
  class FinanceCalculator
    def initialize(property,
                   price = PropertyPriceRepository.new,
                   finance_repo = FinancialDataRepository.new)
      @property = property
      @price_repo = price
      @finance_repo = finance_repo
    end

    def budget_price_diff
      current_max_spend - current_price.amount_in_dollars
    end

    def budget_price_percentage
      ratio = current_price.amount_in_dollars / current_max_spend
      (ratio * 100).round(2)
    end

    private

    attr_reader :property, :price_repo, :finance_repo

    def current_max_spend
      @max_spend ||= finance_repo.last.max_spend
    end
    
    def current_price
      price_repo.current_for_property(property.id)
    end
  end
end

