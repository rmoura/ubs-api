# frozen_string_literal: true

Rails.application.routes.draw do
  mount OpenApi::Rswag::Ui::Engine  => '/api-docs'
  mount OpenApi::Rswag::Api::Engine => '/api-docs'

  root 'health_check/health_check#index', defaults: { format: :json }

  namespace :v1, path: '' do
    resource :establishments, only: %i[], path: '' do
      get 'find_ubs', to: 'establishments#show'
    end
  end

  get '*any', to: 'application#not_found'
end
