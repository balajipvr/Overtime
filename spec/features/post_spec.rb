require 'rails_helper'

describe 'navigate' do
 describe 'index' do
   it "should reach index page successfully" do
     visit posts_path
     expect(page.status_code).to eq(200)
   end
   it "should have a Title posts" do
     visit posts_path
     expect(page).to have_content(/Posts/)
   end
 end
  describe 'form view path' do
    it "should reach to form view path" do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end
    it "should find a form with details" do
      visit new_post_path
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "save"
      expect(page).to have_content("Some rationale")
    end
  end
end
