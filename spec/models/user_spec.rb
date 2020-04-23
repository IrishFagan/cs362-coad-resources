require 'rails_helper'

MIN_EMAIL_LENGTH = 1
MAX_EMAIL_LENGTH = 255

RSpec.describe User, type: :model do

  let(:user) { User.new(email: "test@testc.com", encrypted_password: 'abc123efg', role: '') }

  describe "attributes" do
  
    it "has email" do
      expect(user).to respond_to(:email)
    end

    it "has appropriate email length" do
      expect(user).to validate_length_of(:email).is_at_least(MIN_EMAIL_LENGTH).is_at_most(MAX_EMAIL_LENGTH)
    end

    it "has password" do
      expect(user).to respond_to(:password)
    end

    it "has role" do
      expect(user).to respond_to(:role)
    end
  end

  describe "relationships" do

    it "belongs to organization" do
      expect(user).to belong_to(:organization)
    end

  end
end