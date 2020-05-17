require 'rails_helper'
require 'rspec/rails'

RSpec.describe RegionsController, type: :controller do

  describe "user" do

    it "tests authentication of a regular user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      regular_user = FactoryBot.create(:user)
      sign_in regular_user
      expect(regular_user).to be_valid()
    end

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