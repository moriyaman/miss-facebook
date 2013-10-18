class ApisController < ApplicationController

  def choice_woman
    user_like = @login_user.user_likes.build({to_user_id: params[:to_user_id]})
    render json: {result: user_like.save}
  end

  def create_user_impression
    user_impression = @login_user.user_impressions.build({to_user_id: params[:user_id]})
    render json: {result: user_impression.save}
  end

  def change_women
    #選択されたユーザはそのまま
    @stay_user = User.find(params[:stay_user_id])
    @new_user = User.women.has_photo.sort_by{rand}.last
    stay_user_score = @stay_user.score
    new_user_score = @new_user.score
    @stay_user.update_score(stay_user_score)
    @new_user.update_score(new_user_score)
    stay_user_score >= new_user_score ? @stay_user.to_beyond_user : @new_user.to_beyond_user
    render layout: false
  end

  def create_score
    score = (params[:score].to_i * 20 * 0.8) + rand(20) 
    user_score = UserScore.where(user_id: @login_user.id).first_or_initialize
    user_score.score = score
    render json: {result: user_score.save}
  end
end
