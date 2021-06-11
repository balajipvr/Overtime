require 'rails_helper'

describe 'navigate' do
 describe 'index' do
   before do
     @user = User.create!(email: "test1@gmail.com", password: "1234567", first_name: "bala", last_name: "ji")
     login_as(@user, :scope => :user)
   end
   it "should reach index page successfully" do
      visit posts_path
     expect(page.status_code).to eq(200)
   end
   it "should have a Title posts" do
      visit posts_path
     expect(page).to have_content(/Posts/)
   end
   it "should find the list of posts" do
       visit posts_path
       posts1 = Post.create(date: Date.today, rationale: "posts1",user_id: @user.id)
       posts2 = Post.create(date: Date.today, rationale: "posts2",user_id: @user.id)
       visit posts_path
       expect(page).to have_content(/posts1|posts2/)
   end
 end
  describe 'form view path' do
    before do
    user = User.create!(email: "test1@gmail.com", password: "1234567", first_name: "bala", last_name: "ji")
    login_as(user, :scope => :user)
    visit new_post_path
    end
    it "should reach to form view path" do
      expect(page.status_code).to eq(200)
    end
    it "should find a form with details" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "save"
      expect(page).to have_content("Some rationale")
    end
    it "should have user associated tp post" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Associated"

      click_on "save"
      expect(User.last.posts.last.rationale).to eq("User Associated")
    end
  end
end
