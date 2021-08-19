class ClinicasController < ApplicationController
  before_action :authorize_access_request!, except: [:show, :index]
  before_action :set_clinica, only: [:show, :update, :destroy]

  # GET /clinicas
  def index
    @clinicas = Clinica.all

    render json: @clinicas
  end

  # GET /clinicas/1
  def show
    render json: @clinica
  end

  # POST /clinicas
  def create
    @clinica = Clinica.new(clinica_params)

    if @clinica.save
      render json: @clinica, status: :created, location: @clinica
    else
      render json: @clinica.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clinicas/1
  def update
    if @clinica.update(clinica_params)
      render json: @clinica
    else
      render json: @clinica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clinicas/1
  def destroy
    @clinica.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinica
      @clinica = Clinica.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clinica_params
      params.require(:clinica).permit(:nome, :endereco, :telefone)
    end
end
