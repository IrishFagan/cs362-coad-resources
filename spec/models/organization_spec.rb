require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { (Organization.new(email: "test@test.com")) }
  
  describe "attributes" do
   it "has email" do
     expect(organization).to respond_to(:email)
    end

    it "has name" do
      expect(organization).to respond_to(:name)
    end

    it "has phone number" do
      expect(organization).to respond_to(:phone)
    end

    it "has status" do
      expect(organization).to respond_to(:status)
    end

    it "has primary name" do
      expect(organization).to respond_to(:primary_name)
    end

    it "has secondary name" do
      expect(organization).to respond_to(:secondary_name)
    end

    it "has secondary phone" do
      expect(organization).to respond_to(:secondary_phone)
    end
  
    it "has many tickets" do
      expect(organization).to have_many(:tickets)
    end

    it "has many users" do
      expect(organization).to have_many(:users)
    end
  end

  describe "validations" do
    it "has appropriate email length" do
      expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255)
    end

    it "has appropriate email format" do
      expect(organization).to allow_value("test@test.com").for(:email)
      expect(organization).to allow_value("coolcat@.dot.com").for(:email)
    end

    it "has unique email" do
      expect(organization).to validate_uniqueness_of(:email).case_insensitive
    end

    it "has unique name" do
      expect(organization).to validate_uniqueness_of(:email).case_insensitive
    end
  end

  describe "methods" do
    it "sets organization status to approved" do
      expect(organization.approve).to eq(:approved)
    end
  end
end
