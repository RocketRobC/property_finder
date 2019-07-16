module Web
  module Views
    module FinancialData
      class Index
        include Web::View

        def formatted_total_funds
          format_dollars(financial_data.total_funds_in_dollars)
        end

        def formatted_stamp_duty
          format_dollars(duty_and_max_spend[0])
        end

        def formatted_max_spend
          format_dollars(duty_and_max_spend[1])
        end

        private

        def duty_and_max_spend
          @duty_and_max ||= financial_data.duty_and_max
        end

        def format_dollars(amount)
          '$' + format_number(amount)
        end
      end
    end
  end
end
