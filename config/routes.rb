Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  concern :api_base do
    namespace :services do
      resources :service_orders
      resources :services
    end

    namespace :client, shallow: true do
      resources :companies do
        resources :requesters
      end
      resources :requesters
    end
    
  end

  namespace :v1 do
    concerns :api_base
  end
end
