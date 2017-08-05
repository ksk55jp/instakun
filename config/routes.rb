Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'top/index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  #Changing for omni-auth
  #devise_for :users
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :pictures, only: [:index,:create, :new, :edit, :destroy, :update]
  #root 'pictures#index'
  root 'top#index'
end
