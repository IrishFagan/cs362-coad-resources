require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

  let(:user) { (User.new(email: 'fake@fake.com', password: 'password')) }

  it "confirms user is on dashboard screen" do
    user.confirm

    log_in_as(user)

    visit(dashboard_path)
    expect(page).to have_content('Create Application')
  end

#  it "creates a new organization as a regular user" do
#    user.confirm
#
#    visit(dashboard_path)
#    click_on('Create Application')
#
#    find('[id="organization_liability_insurance_true"]').click
#
#    find('[name="organization[agreement_one]"]').click
#    find('[name="organization[agreement_two]"]').click
#    find('[name="organization[agreement_three]"]').click
#    find('[name="organization[agreement_four]"]').click
#    find('[name="organization[agreement_five]"]').click
#    find('[name="organization[agreement_six]"]').click
#    find('[name="organization[agreement_seven]"]').click
#    find('[name="organization[agreement_eight]"]').click
#
#    fill_in 'organization_primary_name', with: 'Fake Primary Name'
#    fill_in 'organization_name', with: 'Fake Name'
#    fill_in 'organization_title', with: 'Fake Title'
#    fill_in 'organization_phone', with: '5411234567'
#    fill_in 'organization_secondary_name', with: 'Fake Secondary Name'  
#    fill_in 'organization_secondary_phone', with: '5417654321'      
#    fill_in 'organization_email', with: 'fake_org@fake.net'          
#    fill_in 'organization_description', with: 'Fake Description'              
#    find('[name="organization[transportation]"]').click
#
#    click_on('Apply')
#    expect(page).to have_content('Application Submitted')
#  end
end
