class SessionsController < ApplicationController

  def login
    auth = request.env['omniauth.auth']
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to edit_user_path(user.id)
  end
 
  def logout
    @login_user = nil
    session[:user_id] = nil
    redirect_to root_path
  end
end
