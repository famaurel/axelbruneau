Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'articles#index'

  resources :categories, only: [:show]

  resources :articles, only: [:index, :new, :create, :show]

  resources :comments, except: [:show] do
    resources :answers, except: [:show]
  end

  resources :books, only: [:index]

end
