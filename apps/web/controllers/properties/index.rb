module Web::Controllers::Properties
  class Index
    include Web::Action

    expose :properties

    def call(_)
      @properties = PropertyRepository.new.order_by_street_and_availability
    end
  end
end
