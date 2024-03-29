module SessionsHelper
  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    current_user.session_token == session[:session_token]
  end

  def log_in_user!
    session[:session_token] = @user.session_token
  end
end