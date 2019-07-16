# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'dashboard#index'

get '/dashboard', to: 'dashboard#index'

resources :sessions, only: [:new, :create]
delete 'sessions', to: 'sessions#destroy', as: :session

resources :features
resources :properties do
  resources :ratings
  member do
    get 'rating_data'
  end
  resources :property_prices, as: :property_prices
end

resources :evaluation_criteria

resources :financial_data
