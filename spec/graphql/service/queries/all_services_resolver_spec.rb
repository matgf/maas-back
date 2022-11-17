require 'rails_helper'

RSpec.describe 'query AllServicesResolver', type: :request do
  describe 'AllServicesResolver' do
    before(:each) do
      @services = FactoryBot.create_list(:service, 3)
    end

    it 'shows correct amount of services' do
      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      data = json['data']['allServices'].count
      expect(@services.count).to be(data)
    end

    it 'currently shows services' do
      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      response = json['data']['allServices'].map{|s| s['id'].to_i}
      expect(@services.pluck(:id)).to eq(response)
    end
  end

  def query
    <<~GQL
      query{
        allServices {
            id
            name
        }
      }
    GQL
  end
end
