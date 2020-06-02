require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

  let(:organization) { create(:organization) }
  let(:user) { create(:user, organization: organization) }

    before do
      log_in_as(user)
    end

  it "creates a new ticket" do

    region = FactoryBot.create(:region)
    resource_category = FactoryBot.create(:resource_category, :active)
    visit(new_ticket_path)

    fill_in('Full Name', with: 'Fake Name')
    fill_in('Phone Number', with: '503-910-4740')
    select('Fake Region 3', from: "ticket_region_id")
    select('Resource Category Name 3', from: "ticket_resource_category_id")
    fill_in('Description', with: 'Fake Descripition')

    click_on('Send this help request')
    expect(page).to have_content('Ticket Submitted')

  end

end
