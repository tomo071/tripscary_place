Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'homes#top'
  get "/guest" => 'homes#guest'

  get "/my_page" => 'users#show'
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  resources :informations, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy] do
      resource :reports, only:[:create, :destroy]
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
