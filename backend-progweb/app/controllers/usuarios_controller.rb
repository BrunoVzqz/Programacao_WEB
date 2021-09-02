class UsuariosController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    usuario = Usuario.create(nome: usuario_params[:nome],
                            sobrenome: usuario_params[:sobrenome],
                            email: usuario_params[:email],
                            tipo: usuario_params[:tipo],
                            data_nascimento: usuario_params[:data_nascimento],
                            password: usuario_params[:password],
                            password_confirmation: usuario_params[:password_confirmation])
    
    authorize usuario

    if usuario.valid?
      case usuario.tipo
      when "Administrador"
        usuario.save
        creation_render(usuario)
      when "Paciente"
        usuario.save
        paciente = Paciente.new(usuario: usuario).save
        creation_render(usuario)
      when "ProfissionalDaSaude"
        clinica = Clinica.find(usuario_params[:clinica_id])
        unless clinica.nil?
          usuario.save
          profissional = ProfissionalDaSaude.new(usuario: usuario, clinica: clinica).save
          creation_render(usuario)
        else
          clinica_invalida          
        end
      end
    else
      usuario.save!
      creation_render(usuario)
    end
  end

  def perfil
    render json: @current_user, serializer: UsuarioSerializer
  end

  private

  def creation_render(usuario)
    auth_token = AuthenticateUser.new(usuario.email, usuario.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def usuario_params
    params.permit(:email, :tipo, :nome, :sobrenome, :data_nascimento, :password, :password_confirmation, :clinica_id)
  end

  def clinica_invalida
    render json: { clinica_id: "Clinica Invalida" }, status: :unprocessable_entity
  end

end