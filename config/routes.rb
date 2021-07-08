Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path_names: { sign_in: :login,
                                   sign_out: :logout,
                                   sign_up: :register },
                     controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member { post :start }
  end

  resources :passed_tests, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
  end

end
