module Web
  module Controllers
    module FinancialData
      class Update
        include Web::Action

        def call(params)
          repo = FinancialDataRepository.new
          if repo.update(params[:id], params[:financial_data])
            flash[:notice] = 'Total Funds Updated'
            status 201, 'Total Funds Updated'
            redirect_to routes.financial_data_path
          else
            flash[:alert] = 'Update failed'
            status 302, 'Update failed'
            redirect_to routes.financial_data_path
          end
        end
      end
    end
  end
end
