require 'rails_helper'

RSpec.describe 'mutation CreateShiftEngineer', type: :request do
  describe 'CreateShiftEngineer' do
    before(:each) do
      @shift = FactoryBot.create(:shift)
      @engineer = FactoryBot.create(:engineer)
    end

    it 'create shift engineer' do
      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      result = json['data']['CreateShiftEngineer']['shiftEngineer']

      expect(result['id']).not_to be_nil
    end
  end

  def query
    <<~GQL
      mutation {
        CreateShiftEngineer(input: { shiftEngineer: {
          shiftId: #{@shift.id},
          engineerId: #{@engineer.id}
        } } ) {
          shiftEngineer {
                id
                shiftId
                engineerId
          }
        }
      }
    GQL
  end
end
