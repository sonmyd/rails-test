Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      resources :workers
      resources :companies
    end
  end

end
