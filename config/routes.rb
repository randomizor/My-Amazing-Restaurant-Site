MyRestaurantSite::Application.routes.draw do
  
  resources :restaurants
  
  match '/filter', :to => "restaurants#filter"
  
  root :to => "restaurants#index"
  
end
