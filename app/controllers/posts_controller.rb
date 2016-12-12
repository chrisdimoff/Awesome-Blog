class PostsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :destroy, :show]
  before_action :authorize_user, only: [:destroy, :edit, :update]
  before_action :set_page, only: :index
  POSTS_PER_PAGE  = 10
  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :body, :category_id, :facebook_post_this, tag_ids: [])

    @post = Post.new post_params
    @post.user = current_user

    if @post.save

      if @post.facebook_post_this
        token = current_user.oauth_token
        user_graph = Koala::Facebook::API.new(token)
        user_graph.put_wall_post("#{@post.title} #{@post.body}")
      end

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

    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml  { render xml: @post }
      format.json { render json: @post.to_json(include: [:category, :comments]) }
    end



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
      @posts = Post.order(created_at: :desc).includes(:category, :user).page(params[:page]).per(30)


    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml  { render xml: @posts }
      format.json { render json: @posts.to_json(include: [:category, :user]) }
    end

  end

  private

  def set_page
    @page = params[:page] || 0
  end

  def authorize_user

    unless can? :manage, @post
      redirect_to home_path, alert: "access denied"
    end


  end

  def find_post
    @post = Post.find params[:id]
  end

end
