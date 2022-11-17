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
end
