class Admin::BakeriesController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'

  def index
    @bakeries = Bakery.all
    @bakery = Bakery.new
  end
  
  def create
    @bakery = Bakery.new(bakery_params)
    if @bakery.save
      redirect_to admin_bakeries_path
    else
      @bakeries = Bakery.all
      render :index
    end
  end
  
  def destroy
    @bakery = Bakery.find(params[:id])
    @bakery.destroy
    redirect_to admin_bakeries_path, notice: 'ユーザーを削除しました。'
  end
  
  private
  
  def bakery_params
    params.require(:bakery).permit(:shop_name)
  end
end