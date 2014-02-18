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

  def update
    @user = current_user
    @contact_detail = @user.contact_details.first

    if @user.update_attributes(params[:user]) &&
       @contact_detail.update_attributes(params[:contact_details])
      redirect_to @user
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages if @user.errors
      flash.now[:errors] << @contact_detail.errors.full_messages if
        @contact_detail.errors
      render :edit
    end
  end
end
