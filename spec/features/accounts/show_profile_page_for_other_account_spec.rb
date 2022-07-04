# frozen_string_literal: true

require 'rails_helper'

# show profile page for other account
describe 'Account is logged in' do
  let(:account) { FactoryBot.create(:account) }
  let(:other_account) { FactoryBot.create(:account) }

  context 'Navigate to show profile page for other account' do
    it 'Can see profile information' do
      login_as(account, scope: :account)
      visit account_path(other_account)
      expect(page).to have_content other_account.name
      expect(page).to have_content other_account.username
      expect(page).to have_content "Profile"
    end
  end
end