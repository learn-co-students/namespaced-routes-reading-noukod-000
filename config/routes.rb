Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
  end

  namespace :admin do
    resources :stats, only: [:index]
  end

  get '/stats', to: 'stats#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/delete', to: 'authors#delete'
  get '/authors/create', to: 'authors#create'
  get '/comments/moderate', to: 'comments#moderate'

end
