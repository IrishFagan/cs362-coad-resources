  require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

  let(:user) { (User.new(email: 'fake@fake.com', password: 'password')) }
  let(:admin) { (User.new(email: 'fakeadmin@fake.com', password: 'password', role: :admin)) }

  it "approves an organization that a regualr user has submitted" do
    user.confirm
    log_in_as(user)

    visit(dashboard_path)
    click_on('Create Application')

    find('[id="organization_liability_insurance_true"]').click

    find('[name="organization[agreement_one]"]').click
    find('[name="organization[agreement_two]"]').click
    find('[name="organization[agreement_three]"]').click
    find('[name="organization[agreement_four]"]').click
    find('[name="organization[agreement_five]"]').click
    find('[name="organization[agreement_six]"]').click
    find('[name="organization[agreement_seven]"]').click
    find('[name="organization[agreement_eight]"]').click

    fill_in 'organization_primary_name', with: 'Fake Primary Name'
    fill_in 'organization_name', with: 'Fake Name'
    fill_in 'organization_title', with: 'Fake Title'
    fill_in 'organization_phone', with: '5411234567'
    fill_in 'organization_secondary_name', with: 'Fake Secondary Name'  
    fill_in 'organization_secondary_phone', with: '5417654321'      
    fill_in 'organization_email', with: 'fake@fake.com'          
    fill_in 'organization_description', with: 'Fake Description'              
    find('[id="organization_transportation_yes"]').click

    click_on('Apply')
    click_on('Log out')

    admin.confirm
    visit(login_path)
    log_in_as(admin)

    visit(organizations_path)
    click_on('Pending')
    click_on('Review')

    click_on('Approve')

    expect(page).to have_content('has been approved')
  end
end
