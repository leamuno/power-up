Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :powers do
    resources :bookings, only: ["create"]
  end

  resources :bookings, only: ["index", "update", "destroy" ]
end
