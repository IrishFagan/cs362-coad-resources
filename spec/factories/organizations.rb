FactoryBot.define do
	factory :organization do

		sequence(:name) { |n| "Organization Name #{n}" }
		sequence(:email) { |n| "test@test#{n}.com" }
		phone { "+42 23 222 34 54" }
		status { :approved }
		primary_name { "Fake_primary" }
		secondary_name { "Fake_secondary" }
		secondary_phone { "+43 45 333 45 67" }

		trait :submitted do
			status { :submitted }
		end

	end

end