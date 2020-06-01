require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do

  it "deletes a ticket" do
    admin = FactoryBot.create(:user, :admin)
    ticket = FactoryBot.create(:ticket, :open_ticket)
  
    log_in_as(admin)
  
    visit(dashboard_path)
    click_on('fake_open')
    click_on('Close')
    click_on('fake_open')

    expect(page).to have_content('Status Closed')

  end

end
