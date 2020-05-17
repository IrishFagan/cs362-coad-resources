require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  describe "user" do

    let(:regular_user) { create(:user) }

    before(:all) do
      sign_in @regular_user, event: :authentication
    end
  end

#
#  describe "admin" do
#
#    before(:all) do
#      #look up sign_in from devise(?)
#    end
#
#  end
#
#  desribe "public" do
#    #7 tests
#  end
#
end


#  it "temp test factory" do
#    user = build(:user)
#
#    expect(user).to be_valid()
#
#    admin = build(:user, :admin)
#
#    expect(admin).to be_valid()
#  end