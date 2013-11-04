class FrogsController < ApplicationController
  before_action :set_frog, only: [:show, :edit, :update, :destroy]

  def index
    @frogs = Frog.all
    @frog = Frog.new
  end

  def new
    @ponds = Pond.all
    @frog = Frog.new
  end

  def create
    @frog = Frog.new(frog_params)
    @frog.save
    redirect_to frogs_path 
  end

  def show
  end

  def edit
    @ponds = Pond.all
  end

  def update
    @frog.update_attributes(frog_params)
    @frog.save
    redirect_to frogs_path
  end

  def destroy
    @frog.destroy
    redirect_to frogs_path
  end

  private
  def set_frog
    @frog = Frog.find_by(:id => params[:id])
  end
  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
end
