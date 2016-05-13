class TeasController < ApplicationController

  def index
    @teas = Unirest.get("#{ENV['DOMAIN']}/teas.json").body
  end

  def new
    
  end

  def show
    @tea = Unirest.get("#{ENV['DOMAIN']}/teas/#{params[:id]}.json").body
  end

  def create
    Unirest.post("#{ENV['DOMAIN']}/teas?name=#{params[:name]}&origin=#{params[:origin]}&weight=#{params[:weight]}&in_stock=#{params[:in_stock]}")
    redirect_to "/teas"
  end

end