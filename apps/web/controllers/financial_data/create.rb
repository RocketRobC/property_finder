module Web
  module Controllers
    module FinancialData
      class Create
        include Web::Action

        def call(params)
          FinancialDataRepository.new.create(params[:financial_data])
          redirect_to routes.financial_data_path
        end
      end
    end
  end
end
