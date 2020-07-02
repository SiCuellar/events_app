Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/events', to: 'events#create'
      get '/events', to: 'events#index'
    end
  end
end
