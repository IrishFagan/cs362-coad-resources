require 'rails_helper'

RSpec.describe Organization, type: :model do

    let(:organization) { (Organization.new) }

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
    end
end
