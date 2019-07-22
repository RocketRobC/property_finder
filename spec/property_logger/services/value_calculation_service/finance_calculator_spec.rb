module ValueCalculationService
  describe FinanceCalculator do
    let(:timestamp) { Time.parse('2019-07-10 09:00') }
    let(:property_repo) { PropertyRepository.new }
    let(:price_repo) { PropertyPriceRepository.new }
    let(:finance_repo) { FinancialDataRepository.new }
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
    let!(:finance_data) do
      finance_repo.create(total_funds_in_dollars: 1500000)
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

    subject { FinanceCalculator.new(property) }

    it 'calculates the current guide difference to budget' do
      create_price
      expect(subject.budget_price_diff).to eq(435734.0)
    end

    it 'calculates the price to budget percentage' do
      create_price
      expect(subject.budget_price_percentage).to eq(69.65)
    end
  end
end
