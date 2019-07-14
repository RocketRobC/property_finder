module Web
  module Controllers
    module FinancialData
      class Index
        include Web::Action

        expose :financial_data

        def call(params)
          repo = FinancialDataRepository.new
          if repo.all.empty?
            repo.create(total_funds_in_dollars: 0)
          end
          @financial_data = repo.last
        end
      end
    end
  end
end
