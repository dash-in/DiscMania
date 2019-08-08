Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :admins

  resources :settings, only: [:show, :edit, :update]
end
