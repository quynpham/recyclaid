class MaterialsController < ApplicationController
  def index
    @materials = Material.all

    if params[:query].present?
      @materials = Material.search_by_name_and_description_and_location(params[:query])
    end

    @markers = @materials.geocoded.map do |material|
      {
        lat: material.latitude,
        lng: material.longitude
      }
    end
  end

  def show
    @material = Material.find(params[:id])
    @buying = Buying.new
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.user_id = current_user.id
    if @material.save
      redirect_to material_path(@material)
    else
      render :new
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to dashboard_path
  end

  private

  def material_params
    params.require(:material).permit(:name, :description, :location, :price, photos: [])
  end
end
