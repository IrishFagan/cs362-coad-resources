FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test@test#{n}.com" }
    password { "password" }

    after :create do |user|
    	user.confirm
    end
    
  end

  trait :admin do
    role { :admin }
  end

end