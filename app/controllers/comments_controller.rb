class CommentsController < ApplicationController

  before_action :authenticate_user
  # before_action :authorize_user,  only: [:destroy, :edit, :update]

  def create

    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit(:body, :post_id)
    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.user = current_user


    if @comment.save
      redirect_to post_path(@post), notice: "comment created"
    else
      render 'posts/show'
    end
  end

  def destroy
    post = Post.find params[:post_id]
    @comment = Comment.find params[:id]


    if can? :delete, @comment
      @comment.destroy
      redirect_to post_path(post), notice: 'Commented deleted!'
    else
      redirect_to home_path, notice: "access denied"
    end


  end

private

# def authorize_user
#
#   unless can? :delete, @comment
#     redirect_to home_path, alert: "access denied"
#   end
#
# end

end
