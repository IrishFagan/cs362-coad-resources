require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do

  it "cdeletes a resource category as an admin" do
    admin_user = FactoryBot.create(:user, :admin)
  
		log_in_as(admin_user)
		visit(new_resource_category_path)
  
    fill_in 'Name', with: 'Fake Resource Category'
    click_on 'Add resource category'
    expect(page).to have_content("Category successfully created")
    click_on 'Fake Resource Category'
    click_on 'Delete'
    expect(page).to have_content('was deleted')

  end
end
