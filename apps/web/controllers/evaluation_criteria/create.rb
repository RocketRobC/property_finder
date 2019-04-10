module Web::Controllers::EvaluationCriteria
  class Create
    include Web::Action

    params do
      required(:criteria, :name).filled
      required(:criteria, :description)
      required(:criteria, :weight).filled
    end

    def call(params)
      if EvaluationCriteriaRepository.new.create(params_for_create)
        flash[:notice] = 'Criteria created successfully'
        status 201, 'Criteria created successfully'
        redirect_to routes.evaluation_criteria_path
      else
        flash[:alert] = 'Creating criteria failed'
        status 302, 'Creating criteria failed'
        redirect_to routes.evaluation_criteria_path
      end
    end

    private

    def params_for_create
      params[:criteria].transform_keys(&:to_sym)
    end
  end
end
