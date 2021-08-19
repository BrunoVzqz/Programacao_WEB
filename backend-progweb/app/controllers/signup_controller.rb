class SignupController < ApplicationController
  def create
    usuario = Usuario.new(nome: usuario_params[:nome],
                          sobrenome: usuario_params[:sobrenome],
                          email: usuario_params[:email],
                          tipo: usuario_params[:tipo],
                          data_nascimento: usuario_params[:data_nascimento],
                          password: usuario_params[:password],
                          password_confirmation: usuario_params[:password_confirmation])
    if usuario.save
      tipo = usuario_params[:tipo]
      tipo_usuario = tipo.constantize.new(usuario: usuario)
      if tipo == "ProfissionalDaSaude"
        clinica = Clinica.find(usuario_params[:clinica_id])
        tipo_usuario.clinica = clinica
      end
      tipo_usuario.save
      payload  = { usuario_id: usuario.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      render json: { error: usuario.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end

  private

  def usuario_params
    params.permit(:email, :tipo, :nome, :sobrenome, :data_nascimento, :password, :password_confirmation, :clinica_id)
  end
end
