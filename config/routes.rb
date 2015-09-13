Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  mount API::Root, at: '/api'
  mount GrapeSwaggerRails::Engine, at: "/api/docs"
end
