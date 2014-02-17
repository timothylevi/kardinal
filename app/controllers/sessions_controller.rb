class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user
      if @user.is_password?(params[:user][:password])
        login(@user)
        redirect_to @user
      else
        flash.now[:errors] = ["Username or password is incorrect."]
        render :new
      end
    else
      @user = User.new(params[:user])

      create_user(@user)

      @user.contact_details.create(params[:contact_details])
    end
  end

  def destroy
  end
end