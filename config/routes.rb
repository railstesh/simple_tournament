Rails.application.routes.draw do
  resources :teams do
    member do
      patch :approve
      patch :reject
    end
    collection do
      get :search
    end
  end


  resources :tournaments do
    collection do
      get :search
    end
  end
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
