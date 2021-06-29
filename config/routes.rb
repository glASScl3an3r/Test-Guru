Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  root 'tests#index'

  resources :users, only: :create
  get :signup, to: 'users#new'

  resources :sessions, only: :create
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member { post :start }
  end

  resources :passed_tests, only: %i[show update] do
    member { get :result }
  end
end
