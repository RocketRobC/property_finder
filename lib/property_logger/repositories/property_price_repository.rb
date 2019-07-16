class PropertyPriceRepository < Hanami::Repository
  associations do
    belongs_to :property
  end

  def for_property(id)
    property_prices.where(property_id: id)
  end

  def current_for_property(id)
    for_property(id).where { set_at <= Time.now }.order { set_at.desc }.first
  end
end
