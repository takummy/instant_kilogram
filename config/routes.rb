Rails.application.routes.draw do
  
  get 'favorites/index'
  root 'home#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations' 
  }
  
  resources :users, only: %i(index show)
  resources :pictures do
    post :confirm, on: :collection
  end
  resources :favorites, only: %i(index create destroy)

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end