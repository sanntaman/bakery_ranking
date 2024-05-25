class Public::RankingsController < ApplicationController
  def index
    @reviews = Review.joins(:favorites).group(:review_id).select("COUNT(review_id) AS favorites_count", "reviews.*").order(favorites_count: :desc).includes(:bakery)
    @bakeries = Bakery.all
    @review = Review.new
  end
end
