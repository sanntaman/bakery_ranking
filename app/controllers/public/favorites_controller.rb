class Public::FavoritesController < ApplicationController
    before_action :authenticate_user! 
    def create
      current_user.favorites.create(review_id: params[:review_id])
      redirect_to review_path(params[:review_id])
    end
    
    def destroy
      current_user.favorites.find_by(review_id: params[:review_id]).destroy
      redirect_to review_path(params[:review_id])
    end
end
