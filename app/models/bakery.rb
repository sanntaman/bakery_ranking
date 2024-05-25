class Bakery < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
  scope :ranking, -> { joins({reviews: :favorites}).group('reviews.bakery_id').order('count(favorites.review_id) desc') }
end
