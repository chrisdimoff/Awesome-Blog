class PostsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :destroy, :show]
  before_action :authorize_user, only: [:destroy, :edit, :update]

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :body, :category_id, tag_ids: [])
    @post = Post.new post_params
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)

    else
      render :new
    end
  end

  def show

    # @post = Post.find params[:id]
    @category = Category.find @post.category_id
    @comment = Comment.new

    @favourite = @post.favourite_for(current_user)


  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    post_params = params.require(:post).permit(:title, :body, :category_id, tag_ids: [])

    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  def destroy
    @post = Post.find params[:id]

    @post.destroy

    redirect_to posts_path
  end

  def index

    @posts = Post.order(created_at: :desc).page params[:page]

  end

  private

  def authorize_user

    unless can? :manage, @post
      redirect_to home_path, alert: "access denied"
    end


  end

  def find_post
    @post = Post.find params[:id]
  end

end
