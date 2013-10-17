class ChoiceController < ApplicationController

  def index
    @stay_user = @login_user.user_likes.exists? ? @login_user.user_likes.last.to_user : User.has_photo.first
    @new_user =  User.has_photo.sort_by{rand}.last
  end
end
