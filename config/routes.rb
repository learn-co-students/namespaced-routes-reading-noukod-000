Rails.application.routes.draw do
  namespace :admin do
  resources :stats, only: [:index]
end
end
