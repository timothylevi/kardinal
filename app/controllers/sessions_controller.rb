class SessionsController < ApplicationController
  before_filter :require_not_logged_in, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if request.env['omniauth.auth']
      fb_data = request.env['omniauth.auth']
      @user = User.find_by_uid(fb_data[:uid])

      if @user
        login(@user)
        flash[:notices] = "Welcome back, #{@user.first_name}!"
        redirect_to me_url
      else
        @user = User.create_from_fb(fb_data)
        login(@user)
        flash[:notices] = "Welcome, #{@user.first_name}!"
        redirect_to me_url
      end

    else
      @user = User.find_by_email(params[:user][:email])

      if @user
        if @user.is_password?(params[:user][:password])
          login(@user)
          flash[:notices] = "Welcome back, #{@user.first_name}!"
          redirect_to root_url
        else
          flash.now[:errors] = "Your username or password is incorrect."
          render :new
        end
      else
        @user = User.new(params[:user])
        contact = params[:contact_details]

        if create_user(@user, contact).valid?
          login(@user)
          flash[:notices] = "Welcome, #{@user.first_name}!"
          redirect_to me_edit_url
        else
          render :new
        end
      end
    end
  end

  def destroy
    @user = current_user
    logout!

    flash[:notices] = "See you next time, #{@user.first_name}."
    redirect_to login_url
  end
end