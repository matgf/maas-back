require 'rails_helper'

RSpec.describe ShiftEngineer, type: :model do
  describe '#create' do
    before(:each) do
      @shift_engineer = FactoryBot.create(:shift_engineer)
    end
    it 'has a valid factory' do
      expect(@shift_engineer).to be_valid
    end
  end

  describe 'belongs_to engineer' do
    context 'when shift_engineer has engineer' do
      it 'allows accessing engineer from the engineer' do
        engineer = FactoryBot.create(:engineer)
        shift_engineer = FactoryBot.create(:shift_engineer, engineer_id: engineer.id)
        expect(shift_engineer.engineer.id).to be(engineer.id)
      end
    end
  end

  describe 'belongs_to shift' do
    context 'when shift_engineer has shift' do
      it 'allows accessing engineer from the shift' do
        shift = FactoryBot.create(:shift)
        shift_engineer = FactoryBot.create(:shift_engineer, shift_id: shift.id)
        expect(shift_engineer.shift.id).to be(shift.id)
      end
    end
  end
end
