# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :agencies, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  mount KomachiHeartbeat::Engine => '/ops'

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
end
