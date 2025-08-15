class ReviewsController < ApplicationController
    before_action :set_restaurant

    def create
      review = @restaurant.reviews.new(review_params)

      if review.save
        render json: {
          review: review.as_json(only: %i[id content rating created_at]),
          restaurant: @restaurant.as_json(only: %i[id name avg_rating])
        }, status: :created
      else
        render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Restaurant not found" }, status: :not_found
    end

    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
