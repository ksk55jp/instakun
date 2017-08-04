Rails.application.routes.draw do
  get 'top/index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users
  resources :pictures, only: [:index,:create, :new, :edit, :destroy, :update]
  #root 'pictures#index'
  #root 'top#index'
end
