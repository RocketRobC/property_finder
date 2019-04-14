module PropertyRatingService
  describe Calculator do
    let(:criteria_repo) { EvaluationCriteriaRepository.new }
    let(:data) do
      [OpenStruct.new(value: 5), OpenStruct.new(value: 10)]
    end

    before do
      criteria_repo.clear
      @criteria = criteria_repo.create(name: 'test criteria', weight: 50)
    end

    def calculator(data, criteria)
      Calculator.new(data, criteria)
    end

    it 'calculates the weighted average for all user ratings' do
      expect(calculator(data, @criteria).weighted_avg_all_users).to eq(3.75)
    end

    it 'calculates the raw average for all user ratings' do
      expect(calculator(data, @criteria).raw_avg_all_users).to eq(7.5)
    end
  end
end
