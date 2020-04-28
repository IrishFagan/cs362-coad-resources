require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	let (:resource_category) { ResourceCategory.new }

	describe "relationship" do
		it "has and belongs to many organizations" do
			expect(resource_category).to have_and_belong_to_many(:organizations)
		end

		it "has many tickets" do
			expect(resource_category).to have_many(:tickets)
		end
	end

	describe "attributes" do
		it "has a name" do
			expect(resource_category).to respond_to(:name)
		end
	end

	describe "validations" do
		it "has a name with a min or max value" do
			expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255)
		end

		it "has a case insensitive name" do
			expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
		end
	end

	describe "methods" do
		it "creates an Unspecified resource category if one does not exist" do
			expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
			expect{ ResourceCategory.unspecified }.to change(ResourceCategory, :count)
		end

		it "finds an Unspecified resource category if one does exist" do
			ResourceCategory.create(name: 'Unspecified')
			expect(ResourceCategory.where(name: 'Unspecified')).to_not be_empty
			expect{ ResourceCategory.unspecified }.to_not change(ResourceCategory, :count)
		end

		it "returns an Unspecified resource category if one exists" do
			ResourceCategory.create(name: 'Unspecified')
			expect(ResourceCategory.where(name: 'Unspecified')).to_not be_empty
			expect(ResourceCategory.unspecified.name).to eq('Unspecified')
		end

		#ask about these two tests...
		it "updates the active status to true" do
			resource_category.activate
      expect(resource_category.active).to eq(true)
		end

		it "updates the active status to false" do
			resource_category.deactivate
      expect(resource_category.active).to eq(false)
		end

		it "expects to not be active" do
			expect(resource_category.inactive?).to_not eq(:active)
		end

		it "returns the resource category name when to_s is called" do
			fake_rescat = ResourceCategory.new(name: 'FAKE')
			expect(fake_rescat.to_s).to eq('FAKE')
		end
	end

end
