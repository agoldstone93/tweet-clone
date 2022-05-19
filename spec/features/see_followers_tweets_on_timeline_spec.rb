# frozen_string_literal: true

require 'rails_helper'

describe 'Account exists' do
  # create 3 accounts
  let(:account1) { FactoryBot.create(:account) }
  let(:account2) { FactoryBot.create(:account) }
  let(:account3) { FactoryBot.create(:account) }

  # accounts 1 and 2 send a tweet each
  let!(:tweet1) { FactoryBot.create(:tweet, account: account1, content: 'Tweet should be visible') }
  let!(:tweet2) { FactoryBot.create(:tweet, account: account2, content: 'Tweet should be invisible') }

  # account 3 follows account 1 but not 2
  

  context 'Navigate to timeline page' do
    it 'Can see account 1 tweet' do
      login_as(account3, scope: :account)
      visit root
      expect(page).to have_content('This tweet should be visible')
    end

    it 'Cannot see account 2 tweet' do
      login_as(account3, scope: :account)
      visit root
      expect(page).to have_no_content('This tweet should be invisible')
    end
  end
end