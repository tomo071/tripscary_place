Rails.application.routes.draw do
  root 'homes#top'

  resource :users, only: [:show, :edit]
  get 'informations/current_location'
  resources :informations, only: [:new, :create, :index, :show, :edit, :update, :destory] do
    resource :favorites, only:[:create, :destroy]
  end
  get 'countrys/index'
  get 'countrys/edit'
  resources :comments, only:[:create, :destroy]
  resources :countrys, only:[:index, :create, :edit, :update, ]


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
