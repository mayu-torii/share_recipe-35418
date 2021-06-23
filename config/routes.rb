Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
  end  
end
