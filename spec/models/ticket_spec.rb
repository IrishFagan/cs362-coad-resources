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

	#validations

	#methods

end
