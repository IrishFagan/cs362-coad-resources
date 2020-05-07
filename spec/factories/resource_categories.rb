FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |n| "Resource Category Name #{n}" }
  end
end