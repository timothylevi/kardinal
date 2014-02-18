class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def me
    @user = current_user
    render :show
  end

end
