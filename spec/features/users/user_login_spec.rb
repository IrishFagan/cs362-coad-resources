require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
	let(:admin) { (User.new(email: 'unique@test.com', password: 'password', role: :admin)) }

	it "successfully logs in as an admin" do
		admin.confirm

		visit(login_path)
		fill_in 'Email address', with: 'unique@test.com'
		fill_in 'Password', with: 'password'
		click_on 'Sign in'
		expect(page).to have_content('Signed in successfully')
	end
	
end
