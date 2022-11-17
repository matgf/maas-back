FactoryBot.define do
  factory :shift do
    date { Faker::Date.between(from: 7.weeks.ago, to: Date.today)}
    assigned { false }
    start_time { DateTime.now }
    end_time { DateTime.now + 1.hours }
    engineer_id { FactoryBot.create(:engineer).id }
    service_id { FactoryBot.create(:service).id }
  end
end
