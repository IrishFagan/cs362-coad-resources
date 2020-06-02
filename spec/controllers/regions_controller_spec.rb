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

    describe "get#show" do
      specify { expect(get(:show, params: { :id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe "get#edit" do
      specify { expect(get(:edit, params: { :id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe "post#create" do
      specify { expect(get(:create)).to redirect_to(new_user_session_path) }
    end

    describe "patch#update" do
      specify { expect(get(:update, params: { :id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe "delete#destroy" do
      specify { expect(get(:show, params: { :id => 1 })).to redirect_to(new_user_session_path) }
    end

  end

  context "as an organization user" do

    let(:user) { create(:user) }
    let(:region) { create(:region) }

    before do
      sign_in(user)
    end

    describe "#index" do
      specify { expect(get(:index)).to redirect_to(dashboard_path) }
    end

    describe "#new" do
      specify { expect(get(:new)).to redirect_to(dashboard_path) }
    end

    describe "#show" do
      specify { expect(get(:show, params: { :id => 1 })).to redirect_to(dashboard_path) }
    end

    describe "#edit" do
      specify { expect(get(:edit, params: { :id => 1 })).to redirect_to(dashboard_path) }
    end

    describe "#create" do
      specify { expect(get(:create, params: { :id => 1 })).to redirect_to(dashboard_path) }
    end

    describe "#update" do
      specify { expect(get(:update, params: { :id => 1 })).to redirect_to(dashboard_path) }
    end

    describe "#destroy" do
      specify { expect(get(:destroy, params: { :id => 1 })).to redirect_to(dashboard_path) }
    end

  end

  context "as an admin" do

    let(:admin) { create(:user, :admin) }
    let(:region) { create(:region) }

    before do
      sign_in(admin)
    end

    describe "get#index" do
      specify { expect(get(:index)).to be_successful }
    end

    describe "get#new" do
      specify { expect(get(:new)).to be_successful }
    end

    describe "get#show" do
      specify {expect(get(:show, params: { :id => region.id })).to be_successful }
    end

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