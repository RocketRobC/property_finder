module Web::Views::Properties
  class Show
    include Web::View

    def address
      "#{property.street_no} #{property.street_name}"
    end

    def suburb_and_postcode
      "#{property.suburb}, #{property.postcode}"
    end

    def property_map
      unless property.has_saved_map?
        property.get_map
      end
      "#{property.street_no}_#{property.street_name.downcase.sub(' ', '_')}.jpg"
    rescue RuntimeError => e
      e.message
    end

    def rating_modal_form
      Form.new(:property_ratings, "#{property.id}/ratings")
    end
  end
end
