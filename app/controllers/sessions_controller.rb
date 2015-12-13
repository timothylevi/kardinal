class SessionsController < ApplicationController
  before_filter :require_not_logged_in, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if request.env['omniauth.auth']
      fb_data = request.env['omniauth.auth']

      if facebook_login(fb_data)
        flash[:notices] = ["Welcome back, #{@user.first_name}!"]
        redirect_to root_url
      else
        flash[:notices] = ["Welcome, #{@user.first_name}!"]
        redirect_to me_edit_url
      end
    else
      @user = User.find_by_email(params[:user][:email])

      if @user
        logger.info "Checking user credentials, #{@user.inspect}"
        if check_user_credentials(@user)
          logger.info "User logged in #{@user.inspect}"
          flash[:notices] = ["Welcome back, #{@user.first_name}!"]
          sign_in @user, bypass: true
          redirect_to root_url
        else
          flash[:errors] = ["Your username or password is incorrect."]
          render :new
        end
      else
        @user = User.new(user_params)
        if @user.save
          login(@user)
          flash[:notices] = ["Welcome, #{@user.first_name}!"]

          ActivationMailer.signup_email(@user).deliver!
          redirect_to me_edit_url
        else
          flash[:errors] = @user.errors.full_messages

          logger.info "Redirecting. Errors: #{@user.errors.full_messages}"

          render :new
        end
      end
    end
  end

  def destroy
    @user = current_user
    logout!

    flash[:notices] = ["See you next time, #{@user.first_name}."]
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :contact_details, :image, :uid, :provider, :activated)
  end

end
