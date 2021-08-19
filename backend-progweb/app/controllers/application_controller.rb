class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def current_user
    @current_user ||= Usuario.find(payload['usuario_id'])
  end

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end
end
