class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    animal = Animal.new(animal_params)
    if animal.save
      respond_with animal, location: animals_path
    else
      flash[:alert] = "Não foi possível criar o animal: #{animal.errors.full_messages}"
      redirect_to new_animal_path
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)
    respond_with animal, location: animals_path
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    respond_with animal, location: animals_path
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :kind, :monthly_cost, :curator_id)
  end
end
