class MarcasController < ApplicationController
  def index
    @marcas = Marca.includes(vehiculos: :fotografias).order(:nombre_marca)
  end

  def show
    @marca = Marca.includes(vehiculos: :fotografias).find(params[:id])
  end

  def new
    @marca = Marca.new
  end

  def create
    @marca = Marca.new(marca_params)

    if @marca.save
      redirect_to marca_path(@marca), notice: "Marca creada correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def marca_params
    params.require(:marca).permit(:nombre_marca, :pais_origen)
  end
end