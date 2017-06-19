Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # post 'users/create' => 'users#create'
  # get 'users/new' => 'users#new'

  resource :users, only: %i(new create)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/show'
  root 'home#show'

  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id' => 'pictures#show'

  get 'pictures/:id/edit' => 'pictures#edit'
  patch 'pictures/:id' => 'pictures#update'

  delete 'pictures/:id' => 'pictures#destroy'
end
