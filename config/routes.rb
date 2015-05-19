Rails.application.routes.draw do
  namespace :api do
    resources :plannings, defaults: { format: :json } do
      resources :tasks
    end

    resources :weddings
  end
end
