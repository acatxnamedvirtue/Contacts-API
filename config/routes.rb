Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] {resources :contacts, only: [:index]}
  resources :contacts, only: [:create, :destroy, :show, :update]
  resources :contact_shares, only: [:create, :destroy]
end
