require 'rails_helper'

RSpec.describe "Authentication", type: :feature do
  describe 'account can log in' do
    let(:account) { FactoryBot.create(:account) }
    
    context 'with valid log in details' do
      it 'takes me to the homepage' do
        visit new_account_session_path
        within('#new_account') do
          fill_in "Email", with: account.email
          fill_in "Password", with: account.password
        end
        click_button "Log in"
        expect(page).to have_content "Hello #{account.name}"
      end
    end
  end
end
