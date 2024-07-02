class Admin::BakeriesController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'

  def index
    @bakeries = Bakery.all
    @bakery = Bakery.new
    # ビューで表示するための必要なデータを追加する
  end
  
  def create
    @bakery = Bakery.new(bakery_params)
    if @bakery.save
      # 投稿の保存に成功した場合の処理
      redirect_to admin_bakeries_path
    else
      # 投稿の保存に失敗した場合の処理
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