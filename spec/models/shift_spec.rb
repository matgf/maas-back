require 'rails_helper'

RSpec.describe Shift, type: :model do
  describe '#create' do
    before(:each) do
      @shift = FactoryBot.create(:shift)
    end
    it 'has a valid factory' do
      expect(@shift).to be_valid
    end

    it 'validates presence of service' do
      expect(@shift).to validate_presence_of(:service_id)
    end

    it 'validates presence of date' do
      expect(@shift).to validate_presence_of(:date)
    end

    it 'validates presence of start_time' do
      expect(@shift).to validate_presence_of(:start_time)
    end

    it 'validates presence of end_time' do
      expect(@shift).to validate_presence_of(:end_time)
    end
  end

  describe 'belongs_to service' do
    context 'when shift has service' do
      it 'allows accessing service from the shift' do
        service = FactoryBot.create(:service)
        shift = FactoryBot.create(:shift, service_id: service.id)
        expect(shift.service.id).to be(service.id)
      end
    end
  end
  describe 'has_many shift_engineers' do
    context 'when shift has shift_engineers' do
      it 'allows accessing shift_engineers from the shift' do
        shift = FactoryBot.create(:shift)
        shift_engineers = FactoryBot.create_list(:shift_engineer, 2, shift_id: shift.id)

        expect(shift.shift_engineers).to match_array(shift_engineers)
      end
    end
  end
end
