require 'rails_helper'

RSpec.describe Engineer, type: :model do
  describe '#create' do
    before(:each) do
      @engineer = FactoryBot.create(:engineer)
    end
    it 'has a valid factory' do
      expect(@engineer).to be_valid
    end

    it 'validates presence of first name' do
      expect(@engineer).to validate_presence_of(:first_name)
    end

    it 'validates presence of last name' do
      expect(@engineer).to validate_presence_of(:last_name)
    end

    it 'validates presence of service id' do
      expect(@engineer).to validate_presence_of(:service_id)
    end
  end
end
