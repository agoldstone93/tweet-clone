require 'rails_helper'

describe "Account exists" do
  let(:account) { FactoryBot.create(:account) }
  let!(:tweet1) { FactoryBot.create(:tweet, account: account, content: "test first tweet") }
  let!(:tweet2) { FactoryBot.create(:tweet, account: account, content: "test second tweet") }

  context "Navigate to profile page" do
    it "Can see most recent tweets, reverse chronologically" do
      login_as(account, scope: :account)
      visit profile_path
      expect(page).to have_selector("li:nth-child(2)", text: "test first tweet")
      expect(page).to have_selector("li:nth-child(1)", text: "test second tweet")
    end

    it "Can see name and username" do
      login_as(account, scope: :account)
      visit profile_path
      expect(page).to have_content("Name: #{account.name}")
      expect(page).to have_content("Username: @#{account.username}")
    end
  end
end
