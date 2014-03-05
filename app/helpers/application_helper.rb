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
      flash[:warnings] = ["You must be logged in to go there."]

      redirect_to login_url
    end
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def logout!
    current_user.reset_session_token!
    session[:token] = nil
    # session[:last_visited] = nil
  end

  def require_not_logged_in
    unless !logged_in?
      redirect_to root_url
    end
  end

  def facebook_login(fb_data)
    @user = User.find_by_uid(fb_data[:uid])

    if @user
      login(@user)

      return true
    else
      @user = User.create_from_fb(fb_data)
      login(@user)
      ActivationMailer.signup_email(@user).deliver!

      return false
  end

  def check_user_credentials(user)
    if user.is_password?(params[:user][:password])
      login(user)
      return true
    else
      return false
    end
  end

  def create_and_sign_petition(petition)
    petition = current_user.petitions.create(petition)

    petition.petition_signatures.create(user_id: current_user.id)
  end
end
