Rails.application.routes.draw do
  #root 'pictures#index'
  root 'users#index'
  post 'users/login', as:'login_users'
  resources :users do
   resources :pictures
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
