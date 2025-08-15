class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, inclusion: { in: 1..5 }
  after_commit :recompute_avg_rating

  private
  def recompute_avg_rating
    avg = restaurant.reviews.average(:rating) || 0
    restaurant.update(avg_rating: avg)
  end
end
