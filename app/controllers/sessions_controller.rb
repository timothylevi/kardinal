class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user
      if @user.is_password?(params[:user][:password])
        login(@user)
        redirect_to petitions_url
      else
        flash.now[:errors] = ["Username or password is incorrect."]
        render :new
      end
    else
      @user = User.new(params[:user])
      contact = params[:contact_details]

      if create_user(@user, contact).valid?
        login(@user)
        redirect_to me_edit_url
      else
        flash[:errors] = @user.errors.full_messages

        render :new
      end
    end
  end

  def destroy
    logout
    redirect_to login_url
  end
end