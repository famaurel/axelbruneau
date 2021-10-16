Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'articles#index'

  resources :categories, only: [:show] do
    resources :articles do
      resources :comments do
        resources :answers
      end
    end
  end

  resources :books

end
