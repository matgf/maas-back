require 'rails_helper'

RSpec.describe Service, type: :model do
  describe '#create' do
    before(:each) do
      @service = FactoryBot.create(:service)
    end

    it 'has a valid factory' do
      expect(@service).to be_valid
    end

    it 'validates presence of first name' do
      expect(@service).to validate_presence_of(:name)
    end
  end

  describe 'has_many engineers' do
    context 'when service has engineers' do
      it 'allows accessing engineers from the rule' do
        service = FactoryBot.create(:service)
        engineers = FactoryBot.create_list(:engineer, 2, service_id: service.id)

        expect(service.engineers).to match_array(engineers)
      end
    end
  end

  describe 'has_many shifts' do
    context 'when service has engineers' do
      it 'allows accessing engineers from the rule' do
        service = FactoryBot.create(:service)
        shifts = FactoryBot.create_list(:shift, 2, service_id: service.id)

        expect(service.shifts).to match_array(shifts)
      end
    end
  end
end
