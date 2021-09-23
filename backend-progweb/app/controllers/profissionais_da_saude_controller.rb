class ProfissionaisDaSaudeController < ApplicationController
  before_action :authorize_request, except: [:show, :index]
  before_action :set_profissional_da_saude, only: [:show, :destroy]

  # GET /profissionais_da_saude
  def index
    @profissionais_da_saude = ProfissionalDaSaude.all
    authorize @profissionais_da_saude.first
    render json: @profissionais_da_saude, include: ['agendamentos', 'usuario']
  end

  # GET /profissionais_da_saude/1
  def show
    authorize @profissional_da_saude
    render json: @profissional_da_saude, include: ['agendamentos', 'usuario']
  end

  def destroy
    authorize @profissional_da_saude
    @profissional_da_saude.destroy
  end

  private

  def set_profissional_da_saude
    @profissional_da_saude = ProfissionalDaSaude.find(params[:id])
  end
end
