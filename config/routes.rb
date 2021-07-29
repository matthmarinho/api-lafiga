Rails.application.routes.draw do
  post '/authenticate', to: 'authentication#login'
  post '/auth/logout', to: 'authentication#logout'

  resources :users, only: [:show, :update, :index, :create], param: :_username 



  get '/*a', to: 'application#not_found'
end
