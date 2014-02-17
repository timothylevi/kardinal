class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    begin
      @user = User.find_by_email(params[:user][:email])

      if @user.is_password?(params[:user][:password])
        login(@user)
        redirect_to @user
      else
        flash.now[:errors] = ["Username or password is incorrect."]
        render :new
      end
    rescue
      @user = User.new(params[:user])

      create_user(@user)
    end
  end

  def destroy
  end
end