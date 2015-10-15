module V1
  class People < Grape::API
    include V1::Defaults

    resource :people do
      desc "Return list of people"
      paginate
      get do
        paginate Person.all
      end
    end
  end
end
