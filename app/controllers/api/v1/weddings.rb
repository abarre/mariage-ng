module API
  module V1
    class Weddings < Grape::API
      include API::V1::Defaults

      resource :weddings do
        desc "Return list of plannings"
        paginate
        get do
          paginate Wedding.all
        end

        desc "Return a wedding."
        params do
          requires :id, type: Integer, desc: "Wedding id."
        end
        route_param :id do
          get do
            Wedding.find(params[:id])
          end
        end

        desc "Create a wedding."
        params do
          requires :bride, type: String, desc: "name of the bride."
          requires :groom, type: String, desc: "name of the groom."
          requires :date, type: Date, desc: "date of the wedding."
        end
        post do
          wedding = Wedding.new(date: params[:date])
          bride = wedding.build_bride(name: params[:bride])
          groom = wedding.build_groom(name: params[:groom])

          if wedding.save
            wedding
          else
            error!(wedding.errors.full_messages, :unprocessable_entity)
          end
        end
      end
    end
  end
end
