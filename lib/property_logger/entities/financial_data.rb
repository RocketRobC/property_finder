class FinancialData < Hanami::Entity
  DUTY_ESTIMATE = 0.043

  def duty_and_max
    amount = total_funds_in_dollars - (total_funds_in_dollars * DUTY_ESTIMATE)
    duty_for(amount)
  end

  def max_spend
    duty_and_max[1]
  end

  private

  def duty_for(amount)
    duty = StampDutyService.new(amount.round(0)).amount
    sum = amount + duty.round(0)
    return [duty, amount] if sum == total_funds_in_dollars
    if sum < total_funds_in_dollars
      duty_for(amount + 1)
    elsif
      sum > total_funds_in_dollars
      duty_for(amount - 1)
    end
  end
end
