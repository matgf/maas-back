require 'rails_helper'

RSpec.describe 'Query ServiceResolver', type: :request do
  describe 'ServiceResolver' do
    context 'queryin single id' do
      before(:each) do
        @services = FactoryBot.create_list(:service, 3)
      end

      it 'shows correct service' do
        post '/graphql', params: { query: query(id: @services.second.id) }
        json = JSON.parse(response.body)
        result = json['data']['service']

        expect(@services.second.id).to be(result["id"].to_i)
      end
    end

    context 'when id is null' do
      before(:each) do
        @services = FactoryBot.create_list(:service, 3)
      end

      it 'shows correct service' do
        post '/graphql', params: { query: query(id: nil) }
        json = JSON.parse(response.body)
        result = json['data']
        expect(result).to be nil
      end
    end
  end

  def query(id:)
    <<~GQL
      query{
        service(
          id: #{id}
        ) {
            id
            name
        }
      }
    GQL
  end
end
