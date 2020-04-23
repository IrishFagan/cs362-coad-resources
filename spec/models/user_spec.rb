require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new(email: "test@testc.com", encrypted_password: 'abc123efg', role: '') }

  describe "attributes" do
  
    it "has email" do
      expect(user).to respond_to(:email)
    end

    it "has password" do
      expect(user).to respond_to(:password)
    end

    it "has role" do
      expect(user).to respond_to(:role)
    end

  end
end