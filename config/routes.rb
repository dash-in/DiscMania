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

namespace :admin do
  resources :users # => /admin/users etc
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'records#index'

  resources :admins, only: [:show, :edit, :update]

  resources :settings, only: [:show, :edit, :update]

  resources :users, only: [:show, :edit, :update, :destroy]
  get '/users/deleting' => 'users#deleting'
  get '/users/deleted' => 'users#deleted'

  resources :records, only: [:index, :show]
  get '/records/top' => 'records#top'

  resources :artists
  get  '/typeahead' => 'artists#typeahead_action'

  resources :cart_items, only: [:index, :create, :update, :destroy]

  namespace :admin do
    resources :records # => /admin/records etc
  end

  get '/admin/records/artists' => 'admin/records#artists'
end
