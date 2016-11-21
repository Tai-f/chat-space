Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups, only: :new do
    resources :messages, only: :index
  root to: "messages#index"
end
