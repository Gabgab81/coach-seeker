Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'users#show'
    resources :offers, only: [:index, :new, :create, :update, :edit, :show ] do
      collection do
        get :my_courses
    end
  end
end
