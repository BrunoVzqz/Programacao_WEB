class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    usuario = Usuario.find_by!(email: params[:email])
    if usuario.authenticate(params[:password])
      payload = { usuario_id: usuario.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login
      response.set_cookie(JWTSessions.access_cookie,
                        value: tokens[:access],
                        httponly: true,
                        secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf], tipo: usuario.tipo }
    else
      not_found
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end

  private

  def not_found
    render json: { error: "Usuário ou senha errados" }, status: :not_found
  end
end

