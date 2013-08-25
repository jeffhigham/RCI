RTI::Application.routes.draw do

  resources :reports
  resources :home
  resources :sessions
  resources :users
  resources :survey_users
  resources :personality_types
  resources :survey_instance
  root to: 'home#index'
  get 'api/questions/all', to: 'api#all_questions'
  get 'api/questions/find/:id', to: 'api#find'
  get 'dashboard', to: 'sessions#new', as: 'dashboard'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'take_survey', to: 'survey_instance#new', as: 'take_survey'
  get 'survey_user_login', to: 'survey_users#new', as: 'survey_user_login'
  resources :survey_users do
    resources :survey_results
  end
  resources :surveys do
    resources :personality_types
  end
  
end
