class StampDutyService
  BRACKETS = {
    '81001'   => { base: 1307, multiplier: 3.5 },
    '304001'  => { base: 9112, multiplier: 4.5 },
    '1013000' => { base: 41017, multiplier: 5.5 }
  }

  DIVISOR = 100

  def initialize(price)
    @price = price
  end

  def amount
    ((value_diff / DIVISOR) * bracket[:multiplier]) + bracket[:base]
  end

  private

  def bracket
    next_range = nil
    BRACKETS.keys.each_cons(2) do |lower, upper|
      raise 'Price out of range' if @price < lower.to_i
      if (lower.to_i..upper.to_i).include?(@price)
        return { lower: lower }.merge(BRACKETS[lower])
      end
      next_range = upper
    end
    { lower: next_range }.merge(BRACKETS[next_range])
  end

  def value_diff
    @price - bracket[:lower].to_i
  end
end
