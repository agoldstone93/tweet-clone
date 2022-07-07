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
  context 'Account 3 follows account 1 but not account 2' do
    context 'when account 3 navigates to timeline page' do
      before do
        account3.follow(account1)
        login_as(account3, scope: :account)
      end
      it 'Can see account 1 tweet on my timeline' do
        visit root_path
        expect(page).to have_content('Tweet should be visible')
      end
      
      it 'Cannot see account 2 tweet' do
        visit root_path
        expect(page).to have_no_content('Tweet should be invisible')
      end

      it 'Can click on account 1 name to navigate to account 1 profile page' do
        visit root_path
        click_link account1.name
        expect(page.current_path).to eq account_path(account1)
      end
    end
  end
end