class PondsController < ApplicationController
  before_action :set_pond, only: [:show, :edit, :update, :destroy]

  def index
    @ponds = Pond.all
    @pond = Pond.new
  end

  def new
    @pond = Pond.new
  end

  def create
    @pond = Pond.new(pond_params)
    @pond.save
    redirect_to ponds_path 
  end

  def show
  end

  def edit
  end

  def update
    @pond.update_attributes(pond_params)
    redirect_to ponds_path
  end

  def destroy
    @pond.destroy
    redirect_to ponds_path
  end

  private
  def set_pond
    @pond = Pond.find_by(:id => params[:id])
  end
  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end
end