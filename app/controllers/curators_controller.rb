class CuratorsController < ApplicationController
  def index
    @curators = Curator.all
  end

  def new
    @curator = Curator.new
  end

  def create
    curator = Curator.new(curator_params)
    curator.save
    respond_with curator, location: curators_path
  end

  def edit
    @curator = Curator.find(params[:id])
  end

  def update
    curator = Curator.find(params[:id])
    curator.update(curator_params)
    respond_with curator, location: curators_path
  end

  def destroy
    curator = Curator.find(params[:id])
    curator.destroy
    respond_with curator, location: curators_path
  end

  private
  def curator_params
    params.require(:curator).permit(:name, :document, :birthday)
  end
end
