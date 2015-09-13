module API
  class Root < Grape::API
    mount API::V1::Root
    # mount API::V2::Root (next version)
  end
end
