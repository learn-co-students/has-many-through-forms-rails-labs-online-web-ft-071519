class CommentsController < ApplicationController

  def create
    if User.find_by_id(comment_params[:user_id])
      @user = User.find_by_id(comment_params[:user_id])
      comment = @user.comments.build(comment_params)
      comment.save
    elsif comment_params[:user_attributes][:username] != "" && comment_params["user_id"] == ""
      #make a new user and build a comment of theirs using info in comment_params
      @user = User.create(comment_params[:user_attributes])
      comment = @user.comments.build(content: comment_params[:content], post_id: comment_params[:post_id], user_id: @user.id)
      comment.save
    end

    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
