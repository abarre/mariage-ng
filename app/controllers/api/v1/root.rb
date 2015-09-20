module API
  module V1
    class Root < Grape::API
      mount API::V1::People
      mount API::V1::Plannings
      mount API::V1::Weddings

      add_swagger_documentation base_path: "/api",
                                api_version: 'v1',
                                hide_documentation_path: true,
                                hide_format: true
    end
  end
end
