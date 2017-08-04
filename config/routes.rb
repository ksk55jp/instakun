Rails.application.routes.draw do
  get 'top/index'

  devise_for :users
  resources :pictures, only: [:index,:create, :new, :edit, :destroy, :update]
  #root 'pictures#index'
  root 'top#index'
end
