Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root "events#index"
  get "/users/registrations", to: "users/registrations#index"
  resources :events do
    resources :comments, shallow: true, only: [:create, :destroy]
    resources :registrations, shallow: true, only: [:new, :create, :destroy]
  end
end
