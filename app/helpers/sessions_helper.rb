module SessionsHelper

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def login!(user)
    session[:token] = user.reset_session_token!
    @current_user = user
  end

  def require_current_user!
    if current_user.nil?
      flash[:notice] = "Sorry, you are not authorized to do that action."
      redirect_to new_session_url
    end
  end

  def require_logged_out_user!
    if current_user
      flash[:notice] = "Sorry, you are not authorized to do that action."
      redirect_to root_url
    end
  end
end