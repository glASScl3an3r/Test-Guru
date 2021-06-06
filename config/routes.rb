Rails.application.routes.draw do

  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/:test_id/questions/:question_num', to: 'questions#show_ordered'
  delete '/tests/:test_id/questions/:question_num', to: 'questions#destroy_ordered'

end
