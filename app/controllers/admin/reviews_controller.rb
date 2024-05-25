class Admin::ReviewsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
        @reviews = Review.all
  end
  
  def destroy
    @reviews = Review.find(params[:id])
    @reviews.destroy
    redirect_to admin_reviews_path, notice: '投稿を削除しました。'
  end
end
