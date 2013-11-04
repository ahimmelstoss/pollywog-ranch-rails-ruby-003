class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy, :evolve]

  def index
    @tadpoles = Tadpole.all
  end

  def new    
    @frog = Frog.find(params[:frog_id])
  end

  def create
    Tadpole.create(tadpole_params)
    redirect_to tadpoles_path
  end

  def show
  end

  def edit
    @ponds = Pond.all
    @frogs = Frog.all
  end

  def update
    @tadpole.update_attributes(tadpole_params)
    redirect_to tadpoles_path
  end

  def destroy
    @tadpole.destroy
    redirect_to tadpoles_path
  end

  def evolve
    @frog = Frog.new
    @frog.name = @tadpole.name
    @frog.color = @tadpole.color
    @frog.pond = @tadpole.frog.pond
    if @frog.save && @tadpole.destroy
      redirect_to frogs_path
    end
  end

  private
  def set_tadpole
    @tadpole = Tadpole.find_by(:id => params[:id])
  end
  def tadpole_params
    params.require(:tadpole).permit(:name, :color, :frog_id)
  end
end
