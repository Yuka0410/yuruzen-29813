Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'  
  #resources :symptoms, only: [:index] do
   # get 'foods/search'
  #end
  #resources :foods oly: [:show]
end


