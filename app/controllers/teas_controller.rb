class TeasController < ApplicationController

  def index
    @teas = Unirest.get("#{ENV['DOMAIN']}teas.json").body
  end

  def show
    @tea = Unirest.get("#{ENV['DOMAIN']}teas/#{params[:id]}.json").body
  end

  def new
    
  end

  def create
    # Unirest.post("#{ENV['DOMAIN']}/teas?name=#{params[:name]}&origin=#{params[:origin]}&weight=#{params[:weight]}&in_stock=#{params[:in_stock]}")
    tea = Unirest.post("#{ENV['DOMAIN']}teas.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], origin: params[:origin], weight: params[:weight], in_stock: params[:in_stock]}).body
    redirect_to "/teas/#{tea['id']}"
  end

  def edit
    @tea = Unirest.get("#{ENV['DOMAIN']}teas/#{params[:id]}.json").body
  end

  def update
    tea = Unirest.patch("#{ENV['DOMAIN']}teas/#{params[:id]}.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], origin: params[:origin], weight: params[:weight], in_stock: params[:in_stock]}).body
    puts tea
    redirect_to "/teas/#{tea['id']}"
  end

  def destroy
    tea = Unirest.delete("#{ENV['DOMAIN']}teas/#{params[:id]}")
    redirect_to "/teas"
  end

end