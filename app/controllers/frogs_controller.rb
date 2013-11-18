class FrogsController < ApplicationController
  before_action :set_frog, only: [:show, :edit, :update, :destroy]

  def index
    @frogs = Frog.all.sort_by {|f| f.name.downcase}
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

  def give_fly
    Rails.logger.info("PARAMS: #{params.inspect}")
    #PARAMS: {"fly_count"=>"3", "frog_id"=>"1", "action"=>"give_fly", "controller"=>"frogs"}
    frog_id = params["frog_id"]
    frog = Frog.find_by_id(frog_id)
    frog.fly_count += 1 
    frog.save

    render :json => frog
  end

  def edit
    @ponds = Pond.all
  end

  def update
    @frog.update_attributes(frog_params)
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
