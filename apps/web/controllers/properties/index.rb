module Web::Controllers::Properties
  class Index
    include Web::Action

    expose :properties

    def call(_)
      @properties = PropertyRepository.new.all
    end
  end
end
