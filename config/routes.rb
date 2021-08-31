Rails.application.routes.draw do
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :users
  devise_for :admins
  
  root "welcome#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
