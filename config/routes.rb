Bloccipedia::Application.routes.draw do

  # resources :wikis
  # resources :charges

  # devise_for :users

  resources :charges

  devise_for :users

  resources :wikis do
  	resources :users, only: [:destroy]
  end

  root to: 'welcome#index'

end
