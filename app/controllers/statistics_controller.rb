class StatisticsController < ApplicationController

  def index  
    change_template
  end

  def man
  end

  def woman
  end

  private
  def change_template
    render action: @login_user.man? ? 'man' : 'woman' 
  end
end
