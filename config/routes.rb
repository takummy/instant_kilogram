Rails.application.routes.draw do
  
  root 'home#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations' 
  }
  
  resources :users, only: %i(index show)
  resources :pictures do
    post :confirm, on: :collection
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end