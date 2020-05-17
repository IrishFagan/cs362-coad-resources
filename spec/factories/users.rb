FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test@test#{n}.com" }
    password { "password" }
  end

  trait :admin do
    role { :admin }
  end

end