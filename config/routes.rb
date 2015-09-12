# == Route Map
#
#                 Prefix Verb   URI Pattern                                          Controller#Action
#     api_planning_tasks GET    /api/plannings/:planning_id/tasks(.:format)          api/tasks#index {:format=>:json}
#                        POST   /api/plannings/:planning_id/tasks(.:format)          api/tasks#create {:format=>:json}
#  new_api_planning_task GET    /api/plannings/:planning_id/tasks/new(.:format)      api/tasks#new {:format=>:json}
# edit_api_planning_task GET    /api/plannings/:planning_id/tasks/:id/edit(.:format) api/tasks#edit {:format=>:json}
#      api_planning_task GET    /api/plannings/:planning_id/tasks/:id(.:format)      api/tasks#show {:format=>:json}
#                        PATCH  /api/plannings/:planning_id/tasks/:id(.:format)      api/tasks#update {:format=>:json}
#                        PUT    /api/plannings/:planning_id/tasks/:id(.:format)      api/tasks#update {:format=>:json}
#                        DELETE /api/plannings/:planning_id/tasks/:id(.:format)      api/tasks#destroy {:format=>:json}
#          api_plannings GET    /api/plannings(.:format)                             api/plannings#index {:format=>:json}
#                        POST   /api/plannings(.:format)                             api/plannings#create {:format=>:json}
#       new_api_planning GET    /api/plannings/new(.:format)                         api/plannings#new {:format=>:json}
#      edit_api_planning GET    /api/plannings/:id/edit(.:format)                    api/plannings#edit {:format=>:json}
#           api_planning GET    /api/plannings/:id(.:format)                         api/plannings#show {:format=>:json}
#                        PATCH  /api/plannings/:id(.:format)                         api/plannings#update {:format=>:json}
#                        PUT    /api/plannings/:id(.:format)                         api/plannings#update {:format=>:json}
#                        DELETE /api/plannings/:id(.:format)                         api/plannings#destroy {:format=>:json}
#           api_weddings GET    /api/weddings(.:format)                              api/weddings#index
#                        POST   /api/weddings(.:format)                              api/weddings#create
#        new_api_wedding GET    /api/weddings/new(.:format)                          api/weddings#new
#       edit_api_wedding GET    /api/weddings/:id/edit(.:format)                     api/weddings#edit
#            api_wedding GET    /api/weddings/:id(.:format)                          api/weddings#show
#                        PATCH  /api/weddings/:id(.:format)                          api/weddings#update
#                        PUT    /api/weddings/:id(.:format)                          api/weddings#update
#                        DELETE /api/weddings/:id(.:format)                          api/weddings#destroy
#

Rails.application.routes.draw do
  namespace :api do
    resources :plannings, defaults: { format: :json } do
      resources :tasks
    end

    resources :weddings
  end
end
