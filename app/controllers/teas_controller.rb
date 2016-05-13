class TeasController < ApplicationController

  def index
    @teas = Unirest.get("http://localhost:3000/api/v1/teas.json").body
  end

  def new
    
  end

  def show
    @tea = Unirest.get("http://localhost:3000/api/v1/teas/#{params[:id]}.json").body
  end

  def create
    Unirest.post("http://localhost:3000/api/v1/teas?name=#{params[:name]}&origin=#{params[:origin]}&weight=#{params[:weight]}&in_stock=#{params[:in_stock]}")
    redirect_to "/teas"
  end

end