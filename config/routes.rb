Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:idex, :new, :show, :edit, :create] do
    resources :purchaces
  end

  resources :addresses
end
