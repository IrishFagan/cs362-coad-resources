require 'rails_helper'

RSpec.describe Organization, type: :model do

    let(:organization) { (Organization.new) }

    describe "attributes" do
      
      it "has email" do
        expect(organization).to respond_to(:email)
      end
    end
end
