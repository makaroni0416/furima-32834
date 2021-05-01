Rails.application.routes.draw do
  devise_for :users
  root to: "displays#index"
  resources :displays do
    resources :orders, only: [:index, :new, :create]
  end
end
