# frozen_string_literal: true

Rails.application.routes.draw do
  resources :assessments, only: [:index]
  get '/home' , to: 'user_pages#home' # userのhome画面
  get '/cancel', to: 'user_pages#cancel' # サービスからの退会画面
  get '/mailing_direction', to: 'user_pages#mailing_direction' # 鍵書類の送り方説明画面
  
  namespace :admin do
    resources :agencies, only: [:new, :index, :create]
    root to: 'admin_pages#home'
    get 'question', to: 'admin_pages#question'
    resources :candidates, only: [:new, :index, :create] do
      collection do
        get 'user_select'
      end
    end
  end

  resources :mediation_contracts, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :properties do
    member do
      get :price, :properties
    end
  end
  mount KomachiHeartbeat::Engine => '/ops'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }


  resources :users, only: %i[show]
  get 'delegation_contract', to: 'users#delegation_contract' # 委任契約の合意画面
  post 'delegation_contract', to: 'users#delegation_contract'
  get 'docs_agree', to: 'users#docs_agree' # 鍵書類郵送の合意画面
  post 'docs_agree', to: 'users#docs_agree'
  get 'property_assessment', to: 'users#property_assessment' # 机上査定結果を見てからの合意画面
  post 'property_assessment', to: 'users#property_assessment'

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }

  namespace 'api' do
    namespace 'v1' do
      get 'cities', to: 'cities#index'
    end
  end
end
