# frozen_string_literal: true

require 'rails_helper'

describe 'Registration' do
  let(:email) { 'abcde@example.com' }
  let(:name) { 'User Name' }
  let(:username) { 'uname' }
  let(:password) { 'Password' }

  context 'when user does not have an account' do
    context 'and they visit the site' do
      it 'can create an account and log in' do
        visit new_account_registration_path

        fill_in 'Email', with: email
        fill_in 'Name', with: name
        fill_in 'Username', with: username
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password

        click_on 'Sign up'
        expect(page).to have_content "Welcome! You have signed up successfully."
      end
    end
  end
end
