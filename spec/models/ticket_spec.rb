require 'rails_helper'

RSpec.describe Ticket, type: :model do

	let (:ticket) { Ticket.new }

	#relationships
	describe "relationship" do
		it "belongs to region" do
			expect(ticket).to belong_to(:region)
		end

		it "belongs to resource category" do
			expect(ticket).to belong_to(:resource_category)
		end

		#check about .optional in ticket.rb
		it "can belong to organization" do
			expect(ticket).to belong_to(:organization)
		end
	end

	#attributes
	describe "attributes" do
		it "has a name" do
			expect(ticket).to respond_to(:name)
		end

		it "has a phone number" do
			expect(ticket).to respond_to(:phone)
		end
	end

	#validations
	describe "validations" do
		it "has a name with a min or max value" do
			expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "has a max description length" do
			expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
		end

	end

	#methods
	describe "methods" do
		it "expects to not be closed" do
			open_ticket = ticket.open?
			expect(open_ticket).to eq(true)
		end

		it "checks if organization is present" do
			#ticket.captured?
			#expect(ticket.organization).to eq(true)
		end
	end
end
