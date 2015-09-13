Rails.application.routes.draw do
  devise_for :users
  mount API::Root, at: '/api'
  mount GrapeSwaggerRails::Engine, at: "/api/docs"
end
