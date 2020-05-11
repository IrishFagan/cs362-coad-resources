FactoryBot.define do
  factory :ticket do

    phone { '+41 44 111 22 33' }
    region_id { create(:region).id }
    resource_category_id { create(:resource_category).id }

    trait :open_ticket do
      name { 'fake_open' }
      closed { false }
    end

    trait :closed_ticket do
      name { 'fake_closed' }
      closed { true }
    end

    trait :with_org do
      organization
    end

  end
  
end

#build(:ticket, [:open_ticket, :with_org])