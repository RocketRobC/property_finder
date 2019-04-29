module Web::Controllers::Dashboard
  class Index
    include Web::Action

    expose :top_three_ranked_properties

    def call(params)
      @top_three_ranked_properties = PropertyRepository.new.ranked_list.first(3)
    end
  end
end
