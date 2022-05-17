class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end

  private

  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
    @profile = Profile.find_by(user_id: session[:user_id])
  end
end
