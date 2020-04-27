require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	let (:resource_category) { ResourceCategory.new }

	# Relationship
	describe "relationship" do
		it "has and belongs to many organizations" do
			expect(resource_category).to have_and_belong_to_many(:organizations)
		end

		it "has many tickets" do
			expect(resource_category).to have_many(:tickets)
		end
	end

	# Attributes
	describe "attributes" do
		it "has a name" do
			expect(resource_category).to respond_to(:name)
		end
	end

	# Validations
	describe "validations" do
		it "has a name with a min or max value" do
			exp
		end
	end

	# Methods
end
