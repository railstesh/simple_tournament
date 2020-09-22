Rails.application.routes.draw do
  resources :teams do
    get :search, on: :collection

    member do
      get :approve
      get :eject
    end
  end

  resources :tournaments do
    get :search, on: :collection
  end

  devise_for :users
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
