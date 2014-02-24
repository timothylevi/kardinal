class UsersController < ApplicationController
  before_filter :require_logged_in, except: :new

  def new
    @user = User.new
  end

  def show
    @user = User.includes(:contact_details, :signed_petitions, petitions: :victory).find(params[:id])
    @contact_detail = @user.contact_details.first
  end

  def me
    # can this be optimized as much as User#show?
    @user = current_user
    @contact_detail = @user.contact_details.first
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

      flash[:notices] = ["Your profile was successfully updated!"]
      redirect_to me_url
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notices] = ["Your account was successfully deleted."]
    redirect_to root_url
  end
end
