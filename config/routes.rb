Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchaces, only:[:index, :create]
    resources :comments, only:[:new, :create]
    collection do
      get 'search'
    end
  end

  resources :addresses
end
