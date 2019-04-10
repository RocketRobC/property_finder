module Web::Controllers::EvaluationCriteria
  class Destroy
    include Web::Action

    def call(params)
      repo = EvaluationCriteriaRepository.new
      repo.delete(params[:id])
      redirect_to routes.evaluation_criteria_path
    end
  end
end
