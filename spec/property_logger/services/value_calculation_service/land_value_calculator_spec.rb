module ValueCalculationService
  describe LandValueCalculator do
    let(:timestamp) { Time.parse('2019-07-10 09:00') }
    let(:property_repo) { PropertyRepository.new }
    let(:price_repo) { PropertyPriceRepository.new }
    let(:property) do
      property_repo.create(
        description: 'test house',
        street_no: 29,
        street_name: 'Cecil',
        suburb: 'Gordon',
        postcode: '2072',
        land_size: 1000,
        house_size: 200,
        available: true
      )
    end
    
    def create_price
      price_repo.create(
        property_id: property.id,
        amount_in_dollars: 1000000,
        type: 'guide',
        set_at: Time.parse('2019-07-09 09:00')
      )
    end

    before do
      allow(Time).to receive(:now).and_return(timestamp)
    end

    subject { LandValueCalculator.new(property) }

    it 'calculates price per square meter of land' do
      create_price
      expect(subject.per_square_meter).to eq(1000)
    end

    it 'returns 0 if there is not property price set' do
      expect(subject.per_square_meter).to eq(0)
    end
  end
end
