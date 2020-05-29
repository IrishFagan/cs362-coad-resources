require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

	let(:admin) { (User.new(email: 'fakeadmin@fake.com', password: 'password', role: :admin)) }

	it "rejects an organization that a regualr user has submitted" do

		organization = FactoryBot.create(:organization, :submitted)    

		admin.confirm
		visit(login_path)
		log_in_as(admin)

    visit(organizations_path)
    click_on('Pending')
    click_on('Review')
    click_on('Reject')

    expect(page).to have_content('has been rejected')
    
  end

end
