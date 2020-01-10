class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    if @user.save
      session[:crop_x] = user_params[:x]
      session[:crop_y] = user_params[:y]
      session[:crop_width] = user_params[:width]
      session[:crop_height] = user_params[:height]
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :x, :y, :width, :height)
  end
end
