class CommentsController < ApplicationController
  before_filter :require_logged_in

  def create
    if params[:user_id]
      User.find(params[:user_id]).comments.create(user_id: current_user.id, body: params[:comment][:body])
      flash[:notices] = ["Comment saved!"]

      redirect_to user_url(params[:user_id])
    elsif params[:petition_id]
      Petition.find(params[:petition_id]).comments.create(user_id: current_user.id, body: params[:comment][:body])
      flash[:notices] = ["Comment saved!"]

      redirect_to petition_url(params[:petition_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    url = (@comment.commentable_type == "User" ? user_url(@comment.commentable_id) : petition_url(@comment.commentable_id))
    flash[:notices] = ["Comment deleted."]

    redirect_to url
  end
end
