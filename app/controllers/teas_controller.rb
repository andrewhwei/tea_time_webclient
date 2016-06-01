class TeasController < ApplicationController

  def index
    @teas = Tea.all
  end

  def show
    @tea = Tea.find(params[:id])
  end

  def new
    
  end

  def create
    # Specify what params to pass, instead of passing whole params hash because user can enter in special parameters otherwise
    tea = Tea.create(name: params[:name], origin: params[:origin], weight: params[:weight], in_stock: params[:in_stock])
    redirect_to "/teas/#{tea.id}"
  end

  def edit
    @tea = Tea.find(params[:id])
  end

  def update
    tea = Tea.find(params[:id])
    tea.update(id: params[:id], name: params[:name], origin: params[:origin], weight: params[:weight], in_stock: params[:in_stock])
    redirect_to "/teas/#{tea.id}"
  end

  def destroy
    tea = Tea.find(params[:id]).delete
    redirect_to "/teas"
  end

end