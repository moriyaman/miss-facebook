class ChoiceController < ApplicationController

  def index
    @stay_user = @login_user.user_likes.exists? ? @login_user.user_likes.last.user : User.women.has_photo.sort_by{rand}.first
    @new_user = User.women.has_photo.sort_by{rand}.last
    stay_user_score = @stay_user.score
    new_user_score = @new_user.score
    @stay_user.update_score(stay_user_score)
    @new_user.update_score(new_user_score)
    stay_user_score >= new_user_score ? @stay_user.to_beyond_user : @new_user.to_beyond_user
  end
end
