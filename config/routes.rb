Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'users#show'
  resources :offers, only: [:index, :new, :create, :update, :edit, :show ] do
    collection do
      get :my_courses
    end
    resources :reviews, only: [ :new, :create ]
    resources :coachings, only: [:new, :create, :show] do
      member do
        patch :accept
        patch :refuse
      end
      resources :messages, only: [:new, :create]
    end
  end
  namespace :my do
    resources :users, only: [ :show ]
  end
  namespace :my do
    resources :coachings, only: [ :index ]
  end
end
