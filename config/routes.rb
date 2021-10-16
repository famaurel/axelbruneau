Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'articles#index'

  resources :categories, only: [:show] do
    resources :articles, only: [:show] do 
      resources :comments do
        resources :answers
      end
    end
  end

  resources :articles, except: [:show]

  resources :books

  get 'presentation', to: 'pages#presentation'
  get 'projet', to: 'pages#projet'

end
