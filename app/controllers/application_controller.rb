class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user

  def authenticate_user
    @login_user = User.find(session[:user_id]) if session[:user_id]
  end


end
