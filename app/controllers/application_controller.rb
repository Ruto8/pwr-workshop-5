class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include JsEnv

  helper_method :current_user

  def current_user
    return @current_user if defined?(@current_user)
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
end
