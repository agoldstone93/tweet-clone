# frozen_string_literal: true

require 'rails_helper'

describe 'Sign in' do
  let(:account) { FactoryBot.create(:account) }
  let(:token) { account.send_reset_password_instructions }

  context 'User is registered' do
    context 'user attempts to log in with correct credentials' do
      it 'succesfully logs in and displays welcome message' do
        visit new_account_session_path
        
        fill_in 'Email', with: account.email
        fill_in 'Password', with: account.password
        click_button 'Log in'

        expect(page).to have_content "Signed in successfully."
      end
    end

    context 'when user tries to reset password' do
      it 'sends email to user' do
        visit new_account_session_path
        click_on 'Forgot your password?'

        fill_in 'Email', with: account.email
        click_on 'Send me reset password instructions'

        expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
      end
    end
    
    context 'when user visits reset password page' do
      it 'can reset password' do
        visit "#{edit_account_password_path}?reset_password_token=#{token}"

        fill_in 'New password', with: account.password
        fill_in 'Confirm new password', with: account.password
        click_on 'Change my password'

        expect(page).to have_content 'Your password has been changed successfully. You are now signed in.'
      end
    end
  end
end
