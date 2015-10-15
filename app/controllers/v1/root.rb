GrapeDeviseTokenAuth.setup! do |config|
  config.authenticate_all = false
end

module V1
  class Root < Grape::API
    auth :grape_devise_token_auth, resource_class: :user

    helpers GrapeDeviseTokenAuth::AuthHelpers

    mount V1::People
    mount V1::Plannings
    mount V1::Weddings

    add_swagger_documentation base_path: "/",
                              api_version: 'v1',
                              hide_documentation_path: true,
                              hide_format: true
  end
end
