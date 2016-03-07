class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params.merge(item_id: params[:item_id]))
    comment.save
    redirect_to item_url(params[:item_id])
  end

  def destroy

  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
