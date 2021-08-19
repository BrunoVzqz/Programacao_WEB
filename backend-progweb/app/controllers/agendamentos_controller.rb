class AgendamentosController < ApplicationController
  before_action :set_agendamento, only: [:show, :update, :destroy]

  # GET /agendamentos
  def index
    @agendamentos = Agendamento.all

    render json: @agendamentos
  end

  # GET /agendamentos/1
  def show
    render json: @agendamento
  end

  # POST /agendamentos
  def create
    @agendamento = Agendamento.new(agendamento_params)

    if @agendamento.save
      render json: @agendamento, status: :created, location: @agendamento
    else
      render json: @agendamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agendamentos/1
  def update
    if @agendamento.update(agendamento_params)
      render json: @agendamento
    else
      render json: @agendamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agendamentos/1
  def destroy
    @agendamento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agendamento
      @agendamento = Agendamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agendamento_params
      params.require(:agendamento).permit(:data, :profissional_da_saude_id, :paciente_id, :situacao)
    end
end
