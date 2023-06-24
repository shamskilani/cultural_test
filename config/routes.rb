# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :culture_types, only: %i[create index]
      resources :companies, only: %i[create index]
      resources :applicants, only: %i[create index] do
        collection do
          get 'matched/:culture_type', action: 'matched', as: 'matched'
        end
      end
    end
  end
end
