Rails.application.routes.draw do
  get 'rooms/new'
  get '/users/sign_up'
  get '/users/sign_in'
  get '/users/profile'
  get '/users/acount'
  post '/users/login'
  post '/users/logout'
  patch '/users/renewal'
  get '/rooms/posts'
  get '/rooms/search'
  resources :users, only: [:create, :edit, :update]
  resources :rooms, only: [ :create, :show]
  resources :reservations, only: [:index, :new, :create, :show]
  get '/', to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
