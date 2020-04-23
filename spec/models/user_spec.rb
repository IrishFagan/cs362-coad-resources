require 'rails_helper'

RSpec.describe User, type: :model do
  it 'exists' do
      fake_user = User.new
  end
end

RSpec.describe User, type: :model do

  describe "attributes" do
    
    user = User.new(email: "test@testc.com", encrypted_password: 'abc123efg', role: '')
  
    it "has email" do
      expect(user).to respond_to(:email)
    end
  
  end
end