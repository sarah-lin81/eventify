Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  get "/users/registrations", to: "users/registrations#index"
  resources :events do
    resources :comments, shallow: true, only: [:create, :destroy]
    resources :registrations, only: [:new, :create]
  end
end
