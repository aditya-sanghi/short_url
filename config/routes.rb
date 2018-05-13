Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'url_relations#new'

  resources :url_relations, only: [:new, :create]
end
