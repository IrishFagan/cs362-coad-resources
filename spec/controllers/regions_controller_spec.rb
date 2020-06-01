require 'rails_helper'
require 'rspec/rails'

RSpec.describe RegionsController, type: :controller do

  context "as a non-logged in user" do
    
    describe "get#index" do
      specify { expect(get(:index)).to redirect_to(new_user_session_path) }
    end

    describe "get#new" do
      specify { expect(get(:new)).to redirect_to(new_user_session_path) }
    end

  end

  context "as an organization user" do

    let(:user) { create(:user) }

    before do
      sign_in(user)
    end

    specify { expect(get(:index)).to redirect_to(dashboard_path) }

  end

  describe "user" do

    it "tests authentication of a regular user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      regular_user = FactoryBot.create(:user)
      sign_in regular_user
      expect(regular_user).to be_valid()
    end

  end

  it "tests authentication of an admin user" do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin_user = FactoryBot.create(:user, :admin)
    sign_in admin_user
    expect(admin_user).to be_valid()
  end

end

#  desribe "public" do
#    #7 tests
#  end
#


#  it "temp test factory" do
#    user = build(:user)
#
#    expect(user).to be_valid()
#
#    admin = build(:user, :admin)
#
#    expect(admin).to be_valid()
#  end