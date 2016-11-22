Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups, only: [:new, :create] do
    resources :messages, only: :index
  end
  root to: "messages#index"
end
