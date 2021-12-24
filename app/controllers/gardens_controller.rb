class GardensController < ApplicationController
  before_action :set_garden, only: [:edit, :update]

  def index
    @gardens = Garden.all
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    @garden.update(garden_params)
    redirect_to gardens_path, notice: 'Garden was successfully updated.'
  end

   def show
    @garden = Garden.find(params[:id])
    #@plants = Plant.where(gardens_id: params[:id])
    @plants = @garden.plants
  end

private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name)
  end

end
