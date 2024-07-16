class Public::ReviewsController < ApplicationController
  before_action :authenticate_user! 
  def index
    @review = Review.new
    @reviews = Review.all.page(params[:page])
    @bakeries = Bakery.all
  end
  
  def show
    @review = Review.new
    @current_review = Review.find(params[:id])
    @bakeries = Bakery.all
  end
  
  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      @reviews = Review.all
      @bakeries = Bakery.all
      render :index
    end
  end
  
  def destroy
    review = Review.find(params[:id]) 
    review.destroy
    redirect_to reviews_path(review)
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user.id == current_user.id
      redirect_to reviews_path
    end
    @bakeries = Bakery.all
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      @bakeries = Bakery.all
      render :edit
    end
  end
  
  def search
    if params[:keyword].present?
      @reviews = Review.where('comment LIKE ?', "%#{params[:keyword]}%")
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private

  def review_params
    params.require(:review).permit(:evaluate, :image, :comment, :bakery_id)
  end
end
