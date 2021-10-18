Rails.application.routes.draw do

  resources :chars
  post '/authenticate', to: 'authentication#login'
  post '/auth/logout', to: 'authentication#logout'

  resources :users, only: [:show, :update, :index, :create], param: :_username 
  namespace :api do
    namespace :v1 do
      resources :categories, only: [:show, :update, :index, :create]
      resources :maps do
        resources :markers do
        end
      end
      resources :groups
      resources :markers do 
        get 'feed', :on => :collection
      end
      resources :chars do
        delete 'remove_in_batches', :on => :collection
      end
    end
  end


  get '/*a', to: 'application#not_found'
end
