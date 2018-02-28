Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  
  root "pages#home" #controller # action / method
  get '/about', to: 'pages#about' # sending it to the pages controller, about action
  get '/help', to: 'pages#help'
  
  resources :todos # gives all of the CRUD routes
  
end
