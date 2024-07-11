Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :pools
  get '/pools/:id/bookings/new', to: 'bookings#new', as: 'new_pool_booking'
  post '/pools/:id/bookings', to: 'bookings#create', as: 'pool_bookings'
  get '/mypools', to: 'pools#mypools', as: 'my_pools'
  get '/mybookings', to: 'bookings#mybookings', as: 'my_bookings'
  patch '/bookings/:id/update_status', to: 'bookings#update_status', as: 'update_booking_status'
end
