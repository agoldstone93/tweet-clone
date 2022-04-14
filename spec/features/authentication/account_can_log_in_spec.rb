# frozen_string_literal: true

require 'rails_helper'

describe 'Authentication' do
  describe 'account can log in' do
    let(:account) { FactoryBot.create(:account) }

    context 'with valid log in details' do
      it 'displays welcome message' do
        visit new_account_session_path
        fill_in 'Email', with: account.email
        fill_in 'Password', with: account.password
        click_button 'Log in'
        expect(page).to have_content "Signed in successfully."
      end
    end
  end
end
