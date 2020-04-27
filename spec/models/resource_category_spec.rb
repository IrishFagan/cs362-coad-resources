require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    let (:resource_category) { ResourceCategory.new }

    # Relationship
    describe "relationship" do
        it "has and belongs to many organizations" do
            expect(resource_category).to have_and_belong_to_many(:organizations)
        end

        it "has many tickets" do
            expect(resource_category).to have_many(:tickets)
        end
    end

    # Attributes

    # Validations

    # Methods
end
