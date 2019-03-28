module Web::Controllers::Properties
  class Destroy
    include Web::Action

    def call(params)
      repo = PropertyRepository.new
      repo.delete(params[:id])
      redirect_to routes.properties_path
    end
  end
end
