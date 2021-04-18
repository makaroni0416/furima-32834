Rails.application.routes.draw do
  devise_for :users
  root to: "displays#index"
  resources :displays, only: [:index, :new, :create, :show]
end
