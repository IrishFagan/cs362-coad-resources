require 'rails_helper'

MIN_EMAIL_LENGTH = 1
MIN_PASSWORD_LENGTH = 7
MAX_FIELD_LENGTH = 255
EXPECTED_EMAIL = "test@test.com"

RSpec.describe User, type: :model do

  let(:user) { User.new(email: EXPECTED_EMAIL, encrypted_password: 'abc123efg', role: '') }

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

  describe "validations" do

    it "has appropriate email length" do
      expect(user).to validate_length_of(:email).is_at_least(MIN_EMAIL_LENGTH).is_at_most(MAX_FIELD_LENGTH)
    end

    it "has appropriate password length" do
      expect(user).to validate_length_of(:password).is_at_least(MIN_PASSWORD_LENGTH).is_at_most(MAX_FIELD_LENGTH)
    end

    it "has appropriate email format" do
      expect(user).to allow_value("dog@cat.org").for(:email)
      expect(user).to_not allow_value("@coolcats.org").for(:email)
    end

    it "has unique email" do
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end

  end

  describe "relationships" do

    it { should belong_to(:organization).optional }

  end

  describe "methods" do

    it "has a string representation that is the email" do
      expect(user.to_s).to eq(EXPECTED_EMAIL)
    end

    it "sets the default role of the user to organization" do
      expect(user.set_default_role).to eq("organization")
    end

  end
  
end