Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end

    get '/docs', :to => "documentations#index"
  end
  mount API::Root, at: '/api'
  # mount GrapeSwaggerRails::Engine, at: "/api/docs/index"
end
