class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to :back
  end
  private
  def comment_params
    params.require(:comment).permit(:issue_id, :user_id, :content)
  end
end
