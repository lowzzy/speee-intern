Rails.application.routes.draw do
  get 'agencies/home'
  get 'agencies/registration'
  post 'agencies/registration' => 'agencies#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  mount KomachiHeartbeat::Engine => '/ops'
end
