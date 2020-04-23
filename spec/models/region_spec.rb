require 'rails_helper'

RSpec.describe Region, type: :model do

	let(:region) { Region.new }

	# Relationship
	describe "relationship" do
		it "has many tickets" do
			expect(region).to have_many(:tickets)
		end
	end

	# Attributes
	describe "attributes" do
		it "has a name" do
			expect(region).to respond_to(:name)
		end
	end

	# Validations
	describe "validations" do
		it "has a name with a min or max value" do
			expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255)
		end
	end

	# Methods

end
