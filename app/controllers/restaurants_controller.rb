class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def update
    
    @restaurant = Restaurant.find(params[:id])
    
    if @restaurant.update_attributes(params[:restaurant])
      flash[:success] = "Successfully updated restaurant!"
      redirect_to edit_restaurant_path(@restaurant)
    else
      flash[:error] = "Please correct the errors below"
      render "edit"
    end
    
  end

  def destroy
    
    @restaurant = Restaurant.find(params[:id])
    
    @restaurant.destroy
    
    flash[:success] = "Successfully deleted restaurant!"
    redirect_to restaurants_path
    
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
    
    if @restaurant.save
      flash[:success] = "New restaurant successfully added!"
      redirect_to new_restaurant_path
    else
      flash[:error] = "Please correct the errors below"
      render "new"
    end
    
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  def filter
    
    @restaurants = Restaurant.by_filter(params[:filter])
    
    respond_to do |format|
      format.js
    end
    
  end
  
end
