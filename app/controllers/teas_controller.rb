class TeasController < ApplicationController

  def index
    @teas = Tea.all
  end

  def show
    @tea = Tea.find("#{params[:id]}")
  end

  def new
    
  end

  def create
    # Unirest.post("#{ENV['DOMAIN']}/teas?name=#{params[:name]}&origin=#{params[:origin]}&weight=#{params[:weight]}&in_stock=#{params[:in_stock]}")
    tea = Unirest.post("#{ENV['DOMAIN']}teas.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], origin: params[:origin], weight: params[:weight], in_stock: params[:in_stock]}).body
    redirect_to "/teas/#{tea['id']}"
  end

  def edit
    tea_hash = Unirest.get("#{ENV['DOMAIN']}teas/#{params[:id]}.json").body
    @tea = Tea.new(tea_hash)
  end

  def update
    tea = Unirest.patch("#{ENV['DOMAIN']}teas/#{params[:id]}.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], origin: params[:origin], weight: params[:weight], in_stock: params[:in_stock]}).body
    redirect_to "/teas/#{tea['id']}"
  end

  def destroy
    tea = Unirest.delete("#{ENV['DOMAIN']}teas/#{params[:id]}")
    redirect_to "/teas"
  end

end