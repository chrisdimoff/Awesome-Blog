class CommentsController < ApplicationController

  before_action :authenticate_user
  # before_action :authorize_user,  only: [:destroy, :edit, :update]

  def create

    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit(:body, :post_id)
    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.user = current_user

    respond_to do |format|
    if @comment.save
      format.js {render :create_success}
      format.html {redirect_to post_path(@post), notice: "comment created"}
    else
      render 'posts/show'
    end
    end
  end

  def destroy
    @post = Post.find params[:post_id]
    @comment = Comment.find params[:id]

    respond_to do |format|
      if can? :delete, @comment
        @comment.destroy
          format.html{redirect_to post_path(@post), notice: 'Commented deleted!'}
          format.js {render :destroy_success}
      else
        redirect_to home_path, notice: "access denied"
      end
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
