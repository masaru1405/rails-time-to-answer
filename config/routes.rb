Rails.application.routes.draw do

  root "welcome#index"
  get '/search', to: 'search#questions'
  get '/subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
  post '/answer', to: 'answer#question'
  
  namespace :users_backoffice do
    get 'welcome/index' #dashboard
    get 'user_profile', to: 'user_profile#edit'
    patch 'user_profile', to: 'user_profile#update'
    resources :users
  end
  namespace :admins_backoffice do
    get 'welcome/index' #dashboard
    resources :admins 
    resources :subjects
    resources :questions
  end


  devise_for :users
  devise_for :admins, skip: [:registrations]
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
