FactoryBot.define do
  factory :engineer do
    first_name { Faker::Artist.name }
    last_name { Faker::Food.fruits }
    service_id { FactoryBot.create(:service).id }
  end
end
