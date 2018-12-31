Rails.application.routes.draw do
  get 'users/show'
  root 'home#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations' 
  }
  resources :users, only: %i(index show)

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end