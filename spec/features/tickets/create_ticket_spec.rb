require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

  it "creates a new ticket" do
    region = FactoryBot.create(:region)
    resource_category = FactoryBot.create(:resource_category, :active)
    visit(new_ticket_path)

    fill_in('Full Name', with: 'Fake Name')
    fill_in('Phone Number', with: '503-910-4740')
    select('Fake Region 1', from: "ticket_region_id").select_option
    select('Resource Category Name 1', from: "ticket_resource_category_id").select_option
    fill_in('Description', with: 'Fake Descripition')

    click_on('Send this help request')
    expect(page).to have_content('Ticket Submitted')

  end

end
