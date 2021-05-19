class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save!
      redirect_to restaurant_path(@restaurant), notice: "Thanks for your contribution"
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    @review.restaurant = @restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
