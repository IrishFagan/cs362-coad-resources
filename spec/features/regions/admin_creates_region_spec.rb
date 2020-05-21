require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

  it "creates a new region as an admin" do
    admin_user = FactoryBot.create(:user, :admin)
  
    log_in_as(admin_user)
    visit(new_region_path)
  
    fill_in 'Name', with: 'Fake Region'
  end

end
