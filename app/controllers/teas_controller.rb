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
    tea = Tea.create(params)
    redirect_to "/teas/#{tea.id}"
  end

  def edit
    @tea = Tea.find(params[:id])
  end

  def update
    tea = Tea.find(params[:id]).update(params)
    redirect_to "/teas/#{tea.id}"
  end

  def destroy
    tea = Tea.find(params[:id]).delete
    redirect_to "/teas"
  end

end