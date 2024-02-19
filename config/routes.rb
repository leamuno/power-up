Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :powers, only: ["index", "show", "new", "create"] do
    resources :bookings, only: ["create"]
  end

  resources :bookings, only: ["index", "update"]
end
