Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'profile', to: 'users#show'

  resources :offers, only: [:index, :new, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      resources :offers, only: [ :new, :create, :update, :edit, :show ] do
        collection do
          get :my_courses
        end
      end
end
