Rails.application.routes.draw do
  devise_for :users
  root 'home#top'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end