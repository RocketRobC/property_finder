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
resources :properties
