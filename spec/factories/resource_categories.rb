FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |n| "Resource Category Name #{n}" }

    trait :fake_resource_category do
    	name { "Very Real Resource Category" }
    end
  
    trait :active do
    	active { true }
    end

    trait :inactive do
    	active { false }
    end

  end

end