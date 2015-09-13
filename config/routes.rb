Rails.application.routes.draw do
  mount API::Root, at: '/'
  devise_for :users
  mount GrapeSwaggerRails::Engine, at: "/api/docs"
end
