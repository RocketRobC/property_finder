class RatingRepository < Hanami::Repository
  associations do
    belongs_to :property
    belongs_to :evaluation_criteria
    belongs_to :user
  end

  def find_for_property(property_id)
    aggregate(:property).where(property_id: property_id).map_to(Rating).to_a
  end

  def for_property_and_user(property_id, user_id)
    ratings.
      where(property_id: property_id).
      where(user_id: user_id).
      map_to(Rating).to_a
  end

  def for_property_user_and_criteria(property_id, user_id, criteria_id)
    ratings.
      where(property_id: property_id).
      where(user_id: user_id).
      where(evaluation_criteria_id: criteria_id).
      map_to(Rating).first
  end

  def create_for_property(property_id, ratings_list)
    ratings_list.each do |rating_data|
      create(rating_data.merge(property_id: property_id))
    end
  end

  def create_or_update(property_id, data)
    record = for_property_user_and_criteria(property_id, data[:user_id], data[:evaluation_criteria_id])
    data.merge!(property_id: property_id)
    if record
      update(record.id, data)
    else
      create(data)
    end
  end
end
