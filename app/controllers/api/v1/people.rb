# lib/api/v1/posts.rb
module API
  module V1
    class People < Grape::API
      include API::V1::Defaults

      resource :people do
        desc "Return list of people"
        get do
          Person.all
        end
      end
    end
  end
end
