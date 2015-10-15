module V1
  class Plannings < Grape::API
    include V1::Defaults

    resource :plannings do
      desc "Return list of plannings"
      paginate
      get do
        paginate Planning.all
      end

      desc "Return a planning."
      params do
        requires :id, type: Integer, desc: "Planning id."
      end
      route_param :id do
        get do
          Planning.find(params[:id])
        end
      end

      desc "Create a planning."
      params do
        requires :wedding_id, type: Integer, desc: "wedding_id."
      end
      post do
        Planning.create!(wedding_id: params[:wedding_id])
      end

      desc "Update a planning."
      params do
        requires :id, type: Integer, desc: "Planning ID."
        requires :wedding_id, type: Integer, desc: "The wedding id."
      end
      put ':id' do
        Planning.find(params[:id]).update({
          wedding_id: params[:wedding_id]
        })
      end

      desc "Delete a status."
      params do
        requires :id, type: Integer, desc: "Planning ID."
      end
      delete ':id' do
        Planning.find(params[:id]).destroy
      end
    end
  end
end
