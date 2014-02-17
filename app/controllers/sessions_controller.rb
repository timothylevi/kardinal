class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    begin
      @user = User.find_by_email(params[:user][:email])

    if @user
      if @user.is_password?(params[:user][:password])
        # build login functionality
        login(@user)
        render json: @user
      else
        flash.now[:errors] = ["Username or password is incorrect."]
        render :new
      end
    else
      # this needs to be it's own function
      @user = User.new(params[:user])

      if @user.save
        login(@user)
        render json: @user
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end
  end

  def destroy
  end
end