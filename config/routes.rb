Rails.application.routes.draw do
  get '/users/sign_up'
  get '/users/sign_in'
  get '/users/profile'
  get '/users/acount'
  resources :users, only: [:create, :edit, :update]
  get '/', to: 'home#top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
