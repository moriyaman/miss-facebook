class ChoiceController < ApplicationController

  def index
    @user1 = User.women.has_photo.sort_by{rand}.first
    @user2 = User.women.has_photo.sort_by{rand}.last
  end
end
