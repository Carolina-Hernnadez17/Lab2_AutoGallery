class MarcasController < ApplicationController
  def index
    @query = params[:q].to_s.strip
    @country = params[:pais_origen].to_s.strip

    @marcas = Marca.includes(vehiculos: :fotografias).order(:nombre_marca)
    @marcas = @marcas.where("nombre_marca LIKE ?", "%#{@query}%") if @query.present?
    @marcas = @marcas.where("pais_origen LIKE ?", "%#{@country}%") if @country.present?
  end

  def show
    @marca = Marca.includes(vehiculos: :fotografias).find(params[:id])
    @vehiculos = @marca.vehiculos.includes(:fotografias).order(:modelo)
    @vehiculos = @vehiculos.where("modelo LIKE ?", "%#{params[:q]}%") if params[:q].present?
    @vehiculos = @vehiculos.where("color LIKE ?", "%#{params[:color]}%") if params[:color].present?
    @vehiculos = @vehiculos.where(anio: params[:anio]) if params[:anio].present?
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

  def destroy
    @marca = Marca.find(params[:id])
    @marca.destroy

    redirect_to marcas_path, notice: "Marca eliminada correctamente."
  end

  private

  def marca_params
    params.require(:marca).permit(:nombre_marca, :pais_origen)
  end
end