class ChoiceController < ApplicationController

  def index
    @photo_1 = UserPhoto.where(id: 9).first
    @photo_2 = UserPhoto.where(id: 8).last
  end
end
