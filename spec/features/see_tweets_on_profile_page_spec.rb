require 'rails_helper'

describe "Account is logged in" do
  let(:account) { FactoryBot.create(:account) }
  let!(:tweet1) { FactoryBot.create(:tweet, account: account, content: "this is a test") }
  let!(:tweet2) { FactoryBot.create(:tweet, account: account, content: "this is another test tweet") }

  context "Visit profile page" do
    it "Can see most recent tweet" do
      login_as(account, :scope => :account)
      visit profile_path
      expect(page).to have_content ("this is a test")
      expect(page).to have_content ("this is another test tweet")
    end
  end
end
