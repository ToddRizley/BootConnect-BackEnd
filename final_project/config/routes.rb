Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :admins, except: [:new, :edit]
      resources :articles, except: [:new, :edit]
      resources :interests, except: [:new, :edit]
      resources :jobs, except: [:new, :edit]
      resources :locations, except: [:new, :edit]
      resources :organizations, except: [:new, :edit]
      resources :users, except: [:new, :edit, :show]
      get '/users/:email_address', to: 'users#show'
      get '/interests/:user_id', to: 'interests#show'
      get '/locations/:city', to: 'locations#show'
    end
  end
end
