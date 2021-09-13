# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :properties do
    member do
      get :price, :properties
    end
  end
  get 'property_registration', to: 'properties#new'
  mount KomachiHeartbeat::Engine => '/ops'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show]

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }

  namespace 'api' do
    namespace 'v1' do
      get 'prefectures', to: 'prefectures#list'
      get 'cities', to: 'cities#list'
    end
  end
end
