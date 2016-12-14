class HomeController < ApplicationController

  def index
    @recent_posts = Post.all.limit(5).order(created_at: :desc)
    @recent_comments = []

    if current_user
      current_user.posts.limit(5).order(created_at: :desc).each do |post|
        post.comments.each do |comment|
          @recent_comments.push(comment)
        end
      end
    end

    if user_signed_in?
      render :index
    else
      redirect_to posts_path
    end
      

  end

  def about
  end
end
