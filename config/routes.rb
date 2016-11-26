Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create, :show]
  end
  root to: "messages#index"
end
