class FotografiasController < ApplicationController
  before_action :set_marca
  before_action :set_vehiculo

  def new
    @fotografia = @vehiculo.fotografias.new
  end

  def create
    @fotografia = @vehiculo.fotografias.new(fotografia_params)

    if @fotografia.save
      redirect_to marca_vehiculo_path(@marca, @vehiculo), notice: "Fotografía agregada correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_marca
    @marca = Marca.find(params[:marca_id])
  end

  def set_vehiculo
    @vehiculo = @marca.vehiculos.find(params[:vehiculo_id])
  end

  def fotografia_params
    params.require(:fotografia).permit(:ruta_archivo, :angulo, :fecha_subida)
  end
end