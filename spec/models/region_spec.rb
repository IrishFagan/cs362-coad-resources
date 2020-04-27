require 'rails_helper'

RSpec.describe Region, type: :model do

	let(:region) { Region.new }

	describe "relationship" do
		it "has many tickets" do
			expect(region).to have_many(:tickets)
		end
	end

	describe "attributes" do
		it "has a name" do
			expect(region).to respond_to(:name)
		end
	end

	describe "validations" do
		it "has a name with a min or max value" do
			expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255)
		end

		it "has a case insensitive name" do
			expect(region).to validate_uniqueness_of(:name).case_insensitive
		end
	end

	describe "methods" do
		it "creates an Unspecified region if one does not exist" do
			expect(Region.where(name: 'Unspecified')).to be_empty
			expect{ Region.unspecified }.to change(Region, :count)
		end

		it "finds an Unspecified region if one does exist" do
			Region.create(name: 'Unspecified')
			expect(Region.where(name: 'Unspecified')).to_not be_empty
			expect{ Region.unspecified }.to_not change(Region, :count)
		end

		it "returns an Unspecified region if one exists" do
			Region.create(name: 'Unspecified')
			expect(Region.where(name: 'Unspecified')).to_not be_empty
			expect(Region.unspecified.name).to eq('Unspecified')
		end

		it "returns the region name when to_s is called" do
			fake_region = Region.new(name: 'FAKE')
			expect(fake_region.to_s).to eq('FAKE')
		end
	end

end
