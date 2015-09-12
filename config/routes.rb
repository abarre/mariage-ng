Rails.application.routes.draw do
  mount API::Root, at: '/'
  mount GrapeSwaggerRails::Engine, at: "/api/docs"
end
