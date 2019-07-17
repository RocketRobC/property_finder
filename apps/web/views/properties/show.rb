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

    def formatted_current_price
      format_dollars(current_price&.amount_in_dollars)
    end

    def current_price_text
      return 'No price is set for this property.' if current_price.nil?
      if current_price.type == 'guide'
        'The current guide is ' + formatted_current_price
      elsif current_price.type == 'sale'
        'This property sold for ' + formatted_current_price
      end
    end

    private

    def format_dollars(amount)
      return unless amount
      '$' + format_number(amount)
    end
  end
end
