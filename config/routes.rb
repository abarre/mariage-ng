Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/:version/users', :defaults => { :version => "v1" }

  get '/:version/docs', :to => "documentations#index"

  mount Root, at: '/'
end
