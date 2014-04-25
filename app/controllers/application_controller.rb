class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  helper_method :logged_in?, :logout!, :current_user


  def logout!
    current_user.try(:reset_session_token)
    session[:token] = nil
  end

  def logged_in?
    !!current_user
  end


end
