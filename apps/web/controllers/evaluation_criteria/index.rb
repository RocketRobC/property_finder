module Web::Controllers::EvaluationCriteria
  class Index
    include Web::Action

    expose :criteria

    def call(params)
      @criteria = EvaluationCriteriaRepository.new.all
    end
  end
end
