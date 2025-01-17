# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username name])
  end

  def authenticate_account!(_opts = {})
    if account_signed_in?
      super
    else
      redirect_to account_session_path
    end
  end
end
