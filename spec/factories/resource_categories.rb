FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |n| "Resource Category Name #{n}" }
  
    trait :active do
    	active { true }
    end

    trait :inactive do
    	active { false }
    end

  end

end