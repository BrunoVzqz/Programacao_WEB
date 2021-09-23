class PacientesController < ApplicationController
  before_action :authorize_request, except: [:show, :index]
  before_action :set_paciente, only: [:show, :destroy]

  # GET /pacientes
  def index
    @pacientes = Paciente.all
    authorize @pacientes.first
    render json: @pacientes, include: ['agendamentos', 'usuario']
  end

  # GET /pacientes/1
  def show
    authorize @paciente
    render json: @paciente, include: ['agendamentos', 'usuario']
  end

  def destroy
    authorize @paciente
    @paciente.destroy
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end
end
