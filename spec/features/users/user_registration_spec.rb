require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

	it "signs up successfully as organization user" do
		visit(signup_path)
		LoginController.any_instance.expects(:verify_recaptcha).returns(true)
		
		fill_in 'Email address', with: 'signup@test.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'I\'m not a robot'
		click_on 'Sign up'

		expect(page).to have_content('successfully')

	end

end
