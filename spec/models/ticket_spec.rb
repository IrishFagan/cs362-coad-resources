require 'rails_helper'

RSpec.describe Ticket, type: :model do

	let (:ticket) { Ticket.new }

  let(:resource_category) { ResourceCategory.new }
  let(:region) { Region.new }

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
		it "checks if ticket belongs to organization" do
    	organization = Organization.new()
    	ticket = Ticket.new()
    	ticket.organization = organization
    	expect(ticket.organization).to eq(organization)
		end

		it "returns the Ticket id when to_s is called" do
			ticket = Ticket.new(id: 5)
			expect(ticket.to_s).to eq("Ticket 5")
		end

  end

  describe "scope" do

  let(:closed_ticket) { create(:ticket, :closed_ticket) }
  let(:open_ticket) { create(:ticket, :open_ticket) }
  let(:ticket_with_organization) { create(:ticket, :open_ticket, :with_org) }
  let(:ticket_with_organization_2) { create(:ticket, :open_ticket, :with_org) }

    it "returns open tickets" do
      open_tickets = Ticket.open
      expect(open_tickets).to include(open_ticket)
      expect(open_tickets).not_to include(closed_ticket)
    end

    it "returns closed tickets" do
      closed_tickets = Ticket.closed
      expect(closed_tickets).to include(closed_ticket)
      expect(closed_tickets).not_to include(open_ticket)
    end

    it "returns open tickets that have an organization" do
    	tickets = Ticket.all_organization
    	expect(tickets).to include(ticket_with_organization)
    	expect(tickets).to_not include(open_ticket)
    end

    #This may be testing incorrectly, check it out?
    it "returns open ticket with particular organization id" do
    	ticket = Ticket.organization(1)
    	expect(ticket).to include(ticket_with_organization_2)
    	expect(ticket).to_not include(ticket_with_organization)
    end

  end

end
