module PropertyRatingService
  class RatingData
    attr_reader :data
    
    def initialize(property)
      @property = property
      @ratings = property.ratings
    end

    def data
      @ratings.group_by(&:evaluation_criteria_id).map do |criteria_group|
        criteria = EvaluationCriteriaRepository.new.find(criteria_group[0])
        calc = Calculator.new(ratings_for(criteria_group), criteria)
        {
          criteria_description: criteria.name,
          weighted_avg: calc.weighted_avg_all_users,
          raw_avg: calc.raw_avg_all_users
        }
      end
    end

    # TODO: fix this calculation. Should it average by number of criteria?
    def overall_weighted_rating
      puts @ratings.inspect
      @ratings.group_by(&:evaluation_criteria_id).sum do |criteria_group|
        criteria = EvaluationCriteriaRepository.new.find(criteria_group[0])
        calc = Calculator.new(ratings_for(criteria_group), criteria)
        calc.weighted_avg_all_users
      end
    end

    private

    def ratings_for(group)
      group[1]
    end
  end
end
