Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root "events#index"
  get "/users/enrollments", to: "users/enrollments#index"
  get "/users/favorite_events", to: "users/favorite_events#index"
  resources :events do
    resources :comments, shallow: true, only: [:create, :destroy]
    resources :enrollments, shallow: true, only: [:new, :create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :events, only: [] do
        member do
          post :favorite
        end
      end
    end
  end
end
