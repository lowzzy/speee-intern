# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/admin_pages', to: 'admin_pages#home'
  # get 'admin_pages/question'
  namespace :admin do
    root to: 'admin_pages#home'
    get 'question', to: 'admin_pages#question'
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
