require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do

  it "deletes a ticket" do
    admin = FactoryBot.create(:user, :admin)
    ticket = FactoryBot.create(:ticket, :open_ticket)
  
    log_in_as(admin)
  
    visit(dashboard_path)
    click_on('fake_open')
    click_on('Delete')

    expect(page).to have_content('was deleted')

  end

end
