module Web::Views::Properties
  class Show
    include Web::View

    def address
      "#{property.street_no} #{property.street_name}"
    end
  end
end
