class FotografiasController < ApplicationController
  before_action :set_fotografia, only: %i[edit update destroy]

  def index
    @fotografias = Fotografia.includes(vehiculo: :marca).order(created_at: :desc)
  end

  def new
    @fotografia = Fotografia.new(vehiculo_id: params[:vehiculo_id])
  end

  def edit
  end

  def create
    @fotografia = Fotografia.new(fotografia_params)

    if @fotografia.save
      redirect_to @fotografia.vehiculo, notice: "Fotografía agregada correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @fotografia.update(fotografia_params)
      redirect_to @fotografia.vehiculo, notice: "Fotografía actualizada correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    vehiculo = @fotografia.vehiculo
    @fotografia.destroy

    redirect_to vehiculo, notice: "Fotografía eliminada correctamente."
  end

  private

  def set_fotografia
    @fotografia = Fotografia.find(params[:id])
  end

  def fotografia_params
    params.require(:fotografia).permit(:ruta_archivo, :angulo, :vehiculo_id)
  end
end