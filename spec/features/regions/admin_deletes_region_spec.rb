require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

	it "deletes a region as an admin" do
    admin_user = FactoryBot.create(:user, :admin)

    log_in_as(admin_user)
    visit(new_region_path)
  
    fill_in 'Name', with: 'Fake Region'
    click_on 'Add Region'

    visit(regions_path)
    click_on 'Fake Region'
    expect(page).to have_content('Delete')
    click_on 'Delete'
    expect(page).to have_content('deleted')

	end

end
