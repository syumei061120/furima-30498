Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchaces, only:[:index, :create]
  end

  resources :addresses
end
