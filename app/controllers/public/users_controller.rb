class Public::UsersController < ApplicationController
  before_action :authenticate_user! 
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews

  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to reviews_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
