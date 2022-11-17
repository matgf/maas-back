FactoryBot.define do
  factory :shift_engineer do
    shift_id { FactoryBot.create(:shift).id }
    engineer_id { FactoryBot.create(:engineer).id }
  end
end
