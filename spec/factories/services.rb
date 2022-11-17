FactoryBot.define do
  factory :service do
    name { Faker::Movies::HarryPotter.house }
  end
end
