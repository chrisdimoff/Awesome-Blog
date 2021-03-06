class FavouritesController < ApplicationController

  before_action :authenticate_user

  def create
      @post = Post.find params[:post_id]
      @favourite = Favourite.new(user: current_user, post: @post)

      respond_to do |format|
        if cannot? :favourite, @post
          format.html {redirect_to :back, notice: "Access Denied" }
        elsif @favourite.save
          format.js {render :favourite_success}
          format.html {redirect_to :back, notice: "🔅Thanks for favouriting🔅" }
        else
          format.html {redirect_to :back, alert: @favourite.errors.full_messages.join(", ") }
        end
      end
  end

  def destroy
    @favourite = Favourite.find params[:id]
    @post = @favourite.post

    respond_to do |format|
      if @favourite.destroy
        format.js {render :unfavourite_success}
        format.html {redirect_to :back, notice: "🔅Unliked🔅"}
      else
        format.html {redirect_to :back, alert: @favourite.errors.full_messages.join(", ") }
      end
    end
  end
end
