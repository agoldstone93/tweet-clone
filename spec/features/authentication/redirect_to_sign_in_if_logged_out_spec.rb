# frozen_string_literal: true

require 'rails_helper'

describe 'Account is not logged in' do
  context 'navigate to profile page' do
    it 'redirect to sign in page' do
      visit profile_path
      expect(page).to have_current_path new_account_session_path
    end
  end
end

describe 'Account is logged in' do
  let(:account) { FactoryBot.create(:account) }

  context 'navigate to profile page' do
    it 'view profile page' do
      login_as(account, scope: :account)
      visit profile_path
      expect(page).to have_current_path profile_path
    end
  end
end
