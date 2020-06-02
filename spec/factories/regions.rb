FactoryBot.define do
  factory :region do
    sequence(:name) { |n| "Fake Region #{n}" }

    trait :fake_region do
    	name { "Very Real Region" }
    end
  end
end