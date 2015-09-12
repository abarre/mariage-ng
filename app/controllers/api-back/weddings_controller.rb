class Api::WeddingsController < ApplicationController
	def index
		render json: Wedding.all
	end

	def show
		render json: Wedding.find(params[:id])
	end

	def create
		wedding = Wedding.new(wedding_params)
		bride = wedding.build_bride(name: params[:wedding][:bride])
		groom = wedding.build_groom(name: params[:wedding][:groom])

		if wedding.save
	    render :json => wedding
	  else
	    render :json => { :errors => wedding.errors.full_messages }, :status => :unprocessable_entity
	  end
	end

	private

  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def wedding_params
    params.require(:wedding).permit(:date)
  end
end

