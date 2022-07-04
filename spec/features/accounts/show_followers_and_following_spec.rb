# frozen_string_literal: true

require 'rails_helper'

describe 'when logged in' do
  let(:account) { FactoryBot.create(:account) }
  let(:other_account) { FactoryBot.create(:account) }

  before do
    login_as(account, scope: :account)
    account.follow(other_account)
  end

  context 'when navigating to follower page' do
    it 'can see follower' do
      visit followers_account_path(other_account)
      expect(page).to have_content account.name
    end
  end
  
  context 'when navigating to following page' do
    it 'can see following' do
      visit following_account_path(account)
      expect(page).to have_content other_account.name
    end
  end
end