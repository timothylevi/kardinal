class CommentsController < ApplicationController
  before_filter :require_logged_in

  def create
    is_user = request.url.include?("users")

    class_name = (is_user ? User : Petition)
    url = (is_user ? user_url(params[:id]) : petition_url(params[:id]))

    class_name.find(params[:id])
              .comments
              .create(
                user_id: current_user.id,
                body: params[:comment][:body])


    flash[:notices] = ["Comment saved!"]

    redirect_to url
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    url = (@comment.commentable_type == "User" ? user_url(@comment.commentable_id) : petition_url(@comment.commentable_id))
    flash[:notices] = ["Comment deleted."]

    redirect_to url
  end
end
