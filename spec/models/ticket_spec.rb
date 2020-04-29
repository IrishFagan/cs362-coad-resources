require 'rails_helper'

RSpec.describe Ticket, type: :model do

	let (:ticket) { Ticket.new }

	#relationships
	describe "relationship" do
		it "belongs to region" do
			expect(ticket).to belong_to(:region)
		end
		
	end

	#attributes

	#validations

	#methods

end
