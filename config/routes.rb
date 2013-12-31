Bloccipedia::Application.routes.draw do
  get "wikis/index"

  get "wikis/show"

  get "wikis/new"

  get "wikis/edit"

  devise_for :users

  #get "welcome/index"

  root to: 'welcome#index'

end
