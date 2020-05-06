require 'rails_helper'

RSpec.describe Ticket, type: :model do

	let (:ticket) { Ticket.new }

	describe "relationship" do

		it "belongs to region" do
			expect(ticket).to belong_to(:region)
		end

		it "belongs to resource category" do
			expect(ticket).to belong_to(:resource_category)
		end

		it { should belong_to(:organization).optional }

	end

	describe "attributes" do

		it "has a name" do
			expect(ticket).to respond_to(:name)
		end
		
		it "has a phone number" do
			expect(ticket).to respond_to(:phone)
		end
	end

	describe "validations" do

		it "has a name with a min or max value" do
			expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "has a max description length" do
			expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
		end

	end

	describe "methods" do

		it "expects to not be closed" do
			open_ticket = ticket.open?
			expect(open_ticket).to eq(true)
		end

# Need some help here...
		it "checks if ticket belongs to non-existent organization" do
      organization = Organization.new()
      ticket = Ticket.new()
      ticket.organization = organization
      expect(ticket.organization).to eq(organization)
		end

		it "returns the Ticket id when to_s is called" do
			ticket = Ticket.new(id: 5)
			expect(ticket.to_s).to eq("Ticket 5")
		end

    describe "open" do
      it "returns open tickets" do
        #step 1. Create an open tickt and a closed ticket
        closed_ticket = Ticket.create(closed: true)
        open_ticket = Ticket.create(closed: false)
        #step 2. Retreive the array of tickets using Ticket.open
        ticket_arr = Ticket.open
        #step 3. Assert open ticket is in array, closed is not
        expect(ticket_arr).to 
      end
    end

	end
	

end
