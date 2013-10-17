class ApisController < ApplicationController

  def choice_woman
    user_like = @login_user.user_likes.build({to_user_id: params[:to_user_id]})
    render json: {result: user_like.save}
  end

  def create_user_impression
    user_impression = UserImpression.new({user_id: params[:user_id]})
    render json: {result: user_impression.save}
  end

  def change_women
    #選択されたユーザはそのまま
    @user1 = User.women.has_photo.sort_by{rand}.first
    @user2 = User.women.has_photo.sort_by{rand}.last
    render layout: false
  end
end
