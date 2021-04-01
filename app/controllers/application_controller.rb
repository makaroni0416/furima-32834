class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:birthday,:family_name,:first_name,:family_name_kana,:first_name_kana])
  end
end


