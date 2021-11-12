Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments
  end
  resources :users, only: :show
# resources :rooms, only: [:new, :create, :destroy] do
# resources :messages, only: [:index, :create]
end
