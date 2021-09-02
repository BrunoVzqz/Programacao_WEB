class ApplicationController < ActionController::API
  include Pundit
  include Response
  include ExceptionHandler

  attr_reader :current_user

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  rescue_from Pundit::NotAuthorizedError do |exception|
    render json: { error: "Você não tem permissão para realizar essa ação" }, status: :forbidden
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:usuario]
  end
end
