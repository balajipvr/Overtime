require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @user = 1
      @post = Post.create(date: Date.today, rationale: "Sample Text", user_id: @user)
    end
    it "It is expected to create a record" do
      expect(@post).to be_valid
    end
    it "Cannot create a post without date and rational" do
      @post.date = nil
      @post.rationale = nil
       expect(@post).not_to be_valid
    end
  end
end
