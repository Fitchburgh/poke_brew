class BreweryController < ApplicationController
  def index

  end

  def select

  end


  def get
    brewery_object = Brewery.new('name' => params[:brewery])
    brewery_object.write_to(brewery_object)
    respond_to do |format|
      format.json { render json: brewery_object.brewery_readout.to_json }
      format.html { redirect_to '/brewery/index' }
    end
  end
end
