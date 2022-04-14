require 'rails_helper'

describe "Account is not logged in" do
  context "navigate to profile page" do
    it 'redirect to sign in page' do
      visit profile_path
      expect(page).to be new_account_session_path
    end
  end
end
