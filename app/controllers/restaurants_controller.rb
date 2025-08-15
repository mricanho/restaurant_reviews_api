class RestaurantsController < ApplicationController
    def index
      search_query = params[:q]
      restaurants = Restaurant.all
      restaurants = restaurants.where("name ILIKE ?", "%#{search_query}%") if search_query.present?

      render json: restaurants
        .order(:name)
        .as_json(only: %i[id name description avg_rating])
    end

    def show
      restaurant = Restaurant.find(params[:id])
      render json: restaurant.as_json(
        only: %i[id name description avg_rating],
        include: {
          reviews: { only: %i[id content rating created_at] }
        }
      )
    end

    def create
      restaurant = Restaurant.new(restaurant_params)
      if restaurant.save
        render json: restaurant, status: :created
      else
        render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def restaurant_params
      params.require(:restaurant).permit(:name, :description)
    end
end
