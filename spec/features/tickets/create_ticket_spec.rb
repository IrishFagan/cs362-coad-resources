require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

  let(:organization) { create(:organization) }
  let(:user) { create(:user, organization: organization) }

    before do
      log_in_as(user)
    end

  it "creates a new ticket" do

    region = FactoryBot.create(:region, :fake_region)
    resource_category = FactoryBot.create(:resource_category, :active, :fake_resource_category)
    visit(new_ticket_path)

    fill_in('Full Name', with: 'Fake Name')
    fill_in('Phone Number', with: '503-910-4740')
    select('Very Real Region', from: "ticket_region_id")
    select('Very Real Resource Category', from: "ticket_resource_category_id")
    fill_in('Description', with: 'Fake Descripition')

    click_on('Send this help request')
    expect(page).to have_content('Ticket Submitted')

  end

end
