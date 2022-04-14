require 'rails_helper'

describe "Account exists" do
  let(:account) { FactoryBot.create(:account) }
  
  context "Navigate to create tweet page" do
    it "Can create a tweet and see it on timeline" do
      login_as(account, scope: :account)
      visit new_tweet_path
      fill_in 'tweet_content', with: 'This is a test for writing a tweet'
      click_on "Tweet"
      visit timeline_path
      expect(page).to have_content("This is a test for writing a tweet")
    end

  end
end
