Bloccipedia::Application.routes.draw do

  resources :wikis
  resources :charges

  devise_for :users

  root to: 'welcome#index'

end
