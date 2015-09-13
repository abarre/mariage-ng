require 'doorkeeper/grape/helpers'

module API
  module V1
    module Defaults
      # if you're using Grape outside of Rails, you'll have to use Module#included hook
      extend ActiveSupport::Concern

      included do
        include Grape::Kaminari

        helpers Doorkeeper::Grape::Helpers

        before do
          doorkeeper_authorize!
        end

        # common Grape settings
        version 'v1'
        format :json

        # global handler for simple not found case
        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        # global handler for simple record invalid case
        rescue_from ActiveRecord::RecordInvalid do |e|
          error_response(message: e.message, status: 422)
        end

        # global exception handler, used for error notifications
        rescue_from :all do |e|
          if Rails.env.development?
            raise e
          else
            error_response(message: "Internal server error", status: 500)
          end
        end
      end
    end
  end
end
