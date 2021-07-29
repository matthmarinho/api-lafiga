Rails.application.routes.draw do
  post '/authenticate', to: 'authentication#login'
  post '/auth/logout', to: 'authentication#logout'

  resources :users, only: [:show, :update, :index, :create], param: :_username 
  resources :profile

  namespace :api do
    namespace :v1 do
      resources :locations do
        resources :ratings
        resources :comments
      end
    end
  end




  get '/*a', to: 'application#not_found'
end
