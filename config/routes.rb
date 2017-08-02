Rails.application.routes.draw do
  resources :pictures, only: [:index,:create, :new, :edit, :destroy, :update]
  root 'pictures#index'
end
