Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      resources :culture_types, only: [:create, :index]
      resources :companies, only: [:create, :index]
      resources :applicants, only: [:create, :index]
      resources :culture_tests, only: [:create]
    end
  end
end
