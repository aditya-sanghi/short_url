# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'url_relations#index'

  resources :urls, only: :show
  resources :url_relations, only: %i[index create]
end
