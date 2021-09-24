class AgendamentosController < ApplicationController
  before_action :set_agendamento, only: [:show, :update, :destroy]

  # GET /agendamentos
  def index
    if @current_user.tipo == "Paciente"

      @agendamentos = Agendamento.where(paciente_id: @current_user.paciente_id)
        
    elsif @current_user.tipo == "ProfissionalDaSaude"
      @agendamentos = Agendamento.where(profissional_da_saude_id: @current_user.profissional_da_saude_id)
    else
      @agendamentos = Agendamento.all
    end
    
    authorize @agendamentos.first if @agendamentos.any?

    render json: @agendamentos, include: ['resultado']
  end

  # GET /agendamentos/1
  def show
    authorize @agendamento
    render json: @agendamento, include: ['resultado']
  end

  # POST /agendamentos
  def create
    @agendamento = Agendamento.new(agendamento_params)
    authorize @agendamento

    if @agendamento.save
      render json: @agendamento, status: :created, location: @agendamento
    else
      render json: @agendamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agendamentos/1
  def update
    authorize @agendamento

    if @agendamento.update(situacao: agendamento_params[:situacao],
                           data: agendamento_params[:data])
      render json: @agendamento
    else
      render json: @agendamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agendamentos/1
  def destroy
    authorize @agendamento
    @agendamento.destroy
  end

  private
    def set_agendamento
      @agendamento = Agendamento.find(params[:id])
    end

    def agendamento_params
      params.permit(:data, :profissional_da_saude_id, :paciente_id, :situacao, :exame_id)
    end
end
