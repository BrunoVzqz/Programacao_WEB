class ResultadosController < ApplicationController
  before_action :set_resultado, only: [:show, :update, :destroy]

  # GET /resultados
  def index
    @resultados = Resultado.all
    authorize @resultados.first
    render json: @resultados
  end

  # GET /resultados/1
  def show
    authorize @resultado
    render json: @resultado
  end

  # POST /resultados
  def create
    @resultado = Resultado.new(resultado_params)
    authorize @resultado

    if @resultado.save
      render json: @resultado, status: :created, location: @resultado
    else
      render json: @resultado.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resultados/1
  def update
    authorize @resultado
    if @resultado.update(informacoes: resultado_params[:informacoes])
      render json: @resultado
    else
      render json: @resultado.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resultados/1
  def destroy
    authorize @resultado
    @resultado.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resultado
      @resultado = Resultado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resultado_params
      params.permit(:informacoes, :agendamento_id)
    end
end
