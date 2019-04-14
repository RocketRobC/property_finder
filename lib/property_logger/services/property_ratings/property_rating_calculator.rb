module PropertyRatingService
  class Calculator
    attr_reader :rating

    def initialize(ratings, criteria)
      @ratings = ratings
      @criteria = criteria
    end

    def weighted_avg_all_users
      total = @ratings.map do |rating|
        @criteria.weight * rating.value
      end.sum
      (total.to_f / number_of_ratings) / 100.0
    end

    def raw_avg_all_users
      total = @ratings.map(&:value).sum
      total.to_f / number_of_ratings
    end

    private

    def number_of_ratings
      @ratings.size
    end
  end
end
