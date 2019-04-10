module Web::Controllers::Properties::Ratings
  class Create
    include Web::Action

    def call(params)
      params[:property_ratings].each do |rating_data|
        RatingRepository.new.
          create_or_update(params[:property_id], rating_data)
      end
      redirect_to routes.property_path(params[:property_id])
    end
  end
end
