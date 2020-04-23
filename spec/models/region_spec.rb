require 'rails_helper'

RSpec.describe Region, type: :model do

	let(:region) { Region.new }
	
	# Relationship
	describe "relationship" do
		it "has many tickets" do
			expect(Region.new).to have_many(:tickets)
		end
	end

	# Attributes
	describe "attributes" do
		it "has a name" do
			expect(Region.new).to respond_to(:name)
		end
	end
	# Validations
	# Methods

end
