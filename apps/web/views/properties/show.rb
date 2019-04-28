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
      file_name = "#{property.street_no}_#{property.street_name.downcase.split(' ').join('_')}.jpg"
      S3Service.new.presigned_url_for(file_name)
    rescue RuntimeError => e
      Hanami.logger.info("Map load failed: #{e.message}")
    end

    def rating_modal_form
      Form.new(:property_ratings, "#{property.id}/ratings")
    end

    def graph_data
      rating_data.to_json
    end
  end
end
