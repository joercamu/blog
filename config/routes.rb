Rails.application.routes.draw do 
 
  devise_for :users
  resources :articles do 
  	resources :comments, only: [:create, :destroy, :update, :show]
  end
  root 'welcome#index'
end
