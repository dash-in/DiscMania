Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'records#index'

  resources :admins

  resources :settings, only: [:show, :edit, :update]

  resources :users, only: [:show, :edit, :update, :destroy]
  get '/users/deleting' => 'users#deleting'
  get '/users/deleted' => 'users#deleted'

  resources :shipping_infos, only: [:edit, :update, :destroy]

  resources :records, only: [:index, :show] do
    collection do
      get :search
    end
  end

  resources :artists
  get  '/typeahead' => 'artists#typeahead_action'

  resources :cart_items, only: [:index, :create, :update, :destroy] do
    member do
      put :show_update
    end
  end
  
  get '/orders/completed' => 'orders#completed'
  resources :orders, only: [:show, :new, :create]

  # 名前空間上のroute
  namespace :admin do

    resources :users

    resources :orders

    resources :records do
      collection do
        get :search
      end
    end
  end

end
