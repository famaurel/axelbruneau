Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  devise_for :users

  root to: 'articles#index'

  resources :categories, only: [:show] do
    resources :articles, only: [:show, :edit] do
      resources :comments do
        resources :answers
      end
    end
  end

  resources :articles, except: [:show, :edit]

  resources :comments

  resources :books

  get 'admin', to: 'pages#admin'
  get 'mentions', to: 'pages#mentions'
  get 'presentation', to: 'pages#presentation'
  get 'projet', to: 'pages#projet'

end
