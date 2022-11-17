require 'rails_helper'

RSpec.describe 'mutation DestroyShiftEngineer', type: :request do
  describe 'DestroyShiftEngineer' do
    before(:each) do
      @shift_engineer = FactoryBot.create(:shift_engineer)
    end

    it 'destroy shift engineer' do
      post '/graphql', params: { query: query(id: @shift_engineer.id) }
      json = JSON.parse(response.body)
      result = json['data']['DestroyShiftEngineer']['shiftEngineer']

      expect(ShiftEngineer.where(id: @shift_engineer.id).count).to eq 0
    end
  end

  def query(id:)
    <<~GQL
      mutation {
        DestroyShiftEngineer(input: { id: #{id}  } ) {
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
