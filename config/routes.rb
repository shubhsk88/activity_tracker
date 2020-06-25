Rails.application.routes.draw do
  resources :sessions,only:[:new,:index,:create]
  resources :groups,only:[:index,:new,:show,:create]
  resources :users, only:[:new,:create,:show]
  resource :login,only:[:new,:create,:destroy]
  resources :trackers,only:[:index]
  root "trackers#index"
  get "signin", to: "logins#new"
  get "signup",to: "users#new"

  get "sessions/filter/:filter" => "sessions#index", as: :filtered_sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
