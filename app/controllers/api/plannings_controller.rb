class Api::PlanningsController < ApplicationController
	def index
		render json: Planning.all
	end

	def show
		render json: Planning.find(params[:id])
	end

	def create
		Planning.create(params[:planning])
	end
end
