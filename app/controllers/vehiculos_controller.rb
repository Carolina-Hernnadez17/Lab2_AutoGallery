class VehiculosController < ApplicationController
  before_action :set_vehiculo, only: %i[show edit update destroy]

  def index
    @vehiculos = Vehiculo.includes(:marca, :fotografias).order(:modelo)
  end

  def show
  end

  def new
    @vehiculo = Vehiculo.new(marca_id: params[:marca_id])
  end

  def edit
  end

  def create
    @vehiculo = Vehiculo.new(vehiculo_params)

    if @vehiculo.save
      redirect_to @vehiculo, notice: "Vehículo creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @vehiculo.update(vehiculo_params)
      redirect_to @vehiculo, notice: "Vehículo actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vehiculo.destroy

    redirect_to vehiculos_path, notice: "Vehículo eliminado correctamente."
  end

  private

  def set_vehiculo
    @vehiculo = Vehiculo.includes(:fotografias, :marca).find(params[:id])
  end

  def vehiculo_params
    params.require(:vehiculo).permit(:modelo, :anio, :color, :precio, :marca_id)
  end
end