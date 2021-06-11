require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(email: "test1@gmail.com", password: "1234567", first_name: "bala", last_name: "ji")
  end
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
    it "cannot create user without first_name and last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end
  end
  describe "full name" do
    it "should combine first name and last name" do
      expect(@user.full_name).to eq("BALAJI")
    end
  end
end
