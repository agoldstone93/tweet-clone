require 'rails_helper'

Rspec.describe AccountController, type: :controller do
  context 'when not logged in' do
    it 'should redirect following to login page' do
      get :following, id: @account.id
      expect(response).to redirect_to(new_account_session_path)
    end

    it 'should redirect followers to login page' do
      get :followers, id: @account.id
      expect(response).to redirect_to(new_account_session_path)
    end
  end