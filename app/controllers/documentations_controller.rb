class DocumentationsController < ApplicationController
  def index
    @version = params[:version]
    render layout: false
  end
end
