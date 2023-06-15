Rails.application.routes.draw do
  concern :api_base do
    namespace :services do
      resources :services
    end
  end

  namespace :v1 do
    concerns :api_base
  end
end
