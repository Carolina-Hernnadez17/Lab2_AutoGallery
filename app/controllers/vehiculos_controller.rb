class VehiculosController < ApplicationController
  before_action :set_marca, only: %i[new create show]

  def show
    @vehiculo = @marca.vehiculos.includes(:fotografias).find(params[:id])
  end

  def new
    @vehiculo = @marca.vehiculos.new
  end

  def create
    @vehiculo = @marca.vehiculos.new(vehiculo_params)

    if @vehiculo.save
      redirect_to marca_vehiculo_path(@marca, @vehiculo), notice: "Vehículo creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_marca
    @marca = Marca.find(params[:marca_id])
  end

  def vehiculo_params
    params.require(:vehiculo).permit(:modelo, :anio, :color)
  end
end