Rails.application.routes.draw do
  root 'url_relations#new'

  resources :url_relations, only: [:new, :create]
end
