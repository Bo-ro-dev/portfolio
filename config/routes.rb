# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#show'

  resource :dashboard, only: [:show]
  namespace :users do
    resource :profile, only: [:edit, :update], controller: 'profile'
  end
end
