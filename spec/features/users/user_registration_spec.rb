require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

# Feel free to uncomment and work on this one, unsure of how to simulate pressing the recaptcha button...

	it "signs up successfully as organization user" do
		visit(signup_path)
		
		fill_in 'Email address', with: 'signup@test.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'commit'
		expect(page).to have_content('confirmation link')

	end
end
