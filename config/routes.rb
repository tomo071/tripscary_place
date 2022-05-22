Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  resources :informations, only: [:new, :create, :index, :show, :edit, :update, :destory]
  get 'homes/top'
  get 'countrys/index'
  get 'countrys/edit'
  resources :comments, only:[:create, :destroy]
  resources :countrys, only:[:index, :create, :edit, :update, ]
  resource :favorites, only:[:create, :destroy]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
