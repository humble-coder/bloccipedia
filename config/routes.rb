Bloccipedia::Application.routes.draw do

  resources :charges

  devise_for :users

  resources :wikis do
  	resources :users, only: [:destroy, :update, :index]
  end

  root to: 'welcome#index'

end
