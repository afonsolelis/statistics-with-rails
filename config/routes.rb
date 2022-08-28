# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :medians, only: [:index, :create]
  resources :means, only: [:index, :create]
  # root "articles#index"
end
