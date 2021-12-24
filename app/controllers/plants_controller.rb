class PlantsController < ApplicationController
  def index
    if params[:garden_id]
      @garden = Garden.find(params[:garden_id])
     # @plants = Plant.where(gardens_id: params[:garden_id])
      @plants = @garden.plants
    else
      @plants = Plant.all
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    redirect_to plants_path, notice: "garden plant update ok"
  end

  def new
    @plant = Plant.new(params[:id])
  end

  def create
    @plant = Plant.new(plant_params)
    raise
    if @plant.save
      redirect_to garden_plants_path(@plant.garden_id)
    else
      render :new
    end
  end

  private

    def plant_params
      params.require(:plant).permit(:garden_id, :name)
    end
end
