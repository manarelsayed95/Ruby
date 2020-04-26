Rails.application.routes.draw do
  #///////////////////////////////////////////////////////////////////////////////////////////////

  #welcome controllers
  # map requests to http://localhost:3000/welcome/index to the welcome controller's index action.
  get 'welcome/index'

  #map requests to the root of the application to the welcome controller's index action
  root 'welcome#index' 
  #////////////////////////////////////////////////////////////////////////////////////////////////
  #article controller
  resources :articles

  #comments routs 
  resources :articles do
  resources :comments
  end

  #signup form 
  # match ':controller(/:action(/:id))(.:format)'
  resources :users
  resources :sessions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
