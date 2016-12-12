class PasswordResetsController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
       if @user
         @user.create_reset_digest

        #  @user.send_password_reset_email
        #  flash[:info] = "Email sent with password reset instructions"

         redirect_to home_path, notice: "Email sent with password reset instructions"
       else

         render 'new', alert: "Email address not found"
       end
  end
end
