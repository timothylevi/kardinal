class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def me
    @user = current_user
    render :show
  end

  def edit
    @user = current_user
    @contact_detail = @user.contact_details.first
  end
end
