class StatisticsController < ApplicationController
 
  def index
    set_history
    change_template
  end

  def man
  end

  def woman
  end

  #looked 男性:見た、女性:見られた
  #selected 男性:選んだ、女性:選ばれた
  private
  def set_history
    @looked_user_id = @login_user.man? ? @login_user.user_impressions.pluck(:to_user_id).uniq : UserImpression.to_user_id_is(@login_user.id).pluck(:user_id)
    @selected_user_id = @login_user.man? ? @login_user.user_likes.pluck('to_user_id').uniq : UserLike.to_user_id_is(@login_user.id).pluck(:user_id)
    @selected_user_count = @selected_user_id.size
  end
 
  def change_template
    render action: @login_user.man? ? 'woman' : 'woman' 
  end
end
