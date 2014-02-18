module ApplicationHelper
  def login(user)
    session[:token] = user.session_token
    @current_user = user
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    unless logged_in?
      redirect_to login_url, alert: "You must be logged in to go there."
    end
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def logout
    current_user.reset_session_token!
    session[:token] = nil
    # session[:last_visited] = nil
  end

  def require_not_logged_in
    unless !logged_in?
      redirect_to petitions_url, alert: "You can't go there while logged in."
    end
  end
end
