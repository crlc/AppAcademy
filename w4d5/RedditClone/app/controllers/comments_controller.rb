class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    # post = Post.find(params[:post_id])
    # @comment.post_id = post.id
    if @comment.save
      redirect_to @comment.post
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
