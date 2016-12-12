class CallbacksController < ApplicationController
  def google

    google_data = request.env['omniauth.auth']
    user = User.from_omniauth(google_data)
    session[:user_id] = user.id

    redirect_to home_path, notice: 'Thanks for signing in with Google.'
  end
  def facebook

    facebook_data = request.env['omniauth.auth']
    user = User.from_omniauth(facebook_data)
    session[:user_id] = user.id

    redirect_to home_path, notice: 'Thanks for signing in with facebook.'
  end



end
