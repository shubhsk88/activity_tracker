Rails.application.routes.draw do
  resources :sessions
  resources :groups
  resources :users
  resource :login,only:[:new,:create,:destroy]
  resources :trackers,only:[:index]
  root "trackers#index"
  get "signin", to: "logins#new"
  get "signup",to: "users#new"

  get "sessions/filter/:filter" => "sessions#index", as: :filtered_sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
