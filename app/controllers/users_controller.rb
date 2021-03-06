class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :edit_photo, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  
  def edit_photo
  end 


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      if @login_user.man?
        redirect_to choice_path
      else
        redirect_to statistics_path
      end
    else
      format.html { render action: 'edit' }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nick_name, :country_id, :address, :birthday, :gender, :occupation_id, :mail, :uid, :friend_allow_flg, :closed_flg, :self_introduction, :access_token, :oauth_expires_at, :user_photo_attributes => [:id, :user_id, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :created_at, :updated_at, :_destroy])
    
    end
end
