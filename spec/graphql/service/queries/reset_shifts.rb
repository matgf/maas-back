require 'rails_helper'

RSpec.describe 'Query ResetShifts', type: :request do
  describe 'ResetShifts' do
    context 'reseting the shift to assign new shifts' do
      before(:each) do

        @service = FactoryBot.create(:service)
        @shifts = FactoryBot.create_list(:shift, 20, service_id: @service.id, engineer_id: nil, assigned: false)
        @engineers = FactoryBot.create_list(:engineer, 3, service_id: @service.id)

        @engineers.each do |e|
          FactoryBot.create(:shift_engineer, shift_id: @shifts.sample.id, engineer_id: e.id)
        end
      end

      it 'checks if at least one shift is assigned' do
        post '/graphql', params: { query: query(id: @service.id) }
        json = JSON.parse(response.body)
        result = json['data']['resetShifts']
        expect(result.map{|shift| shift['assigned']}.include? true).to eq true
      end

      it 'checks if at least one shift has engineer id' do
        post '/graphql', params: { query: query(id: @service.id) }
        json = JSON.parse(response.body)
        result = json['data']['resetShifts']
        expect(result.map{|shift| shift['engineer_id']}.compact.count).to to be > 0
      end
    end
  end

  def query(id:)
    <<~GQL
      query{
        resetShifts(serviceId: #{id}){
            id
            assigned
            engineerId
        }
      }
    GQL
  end
end
