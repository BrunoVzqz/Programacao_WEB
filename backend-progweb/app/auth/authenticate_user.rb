class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    if usuario
      atributos = usuario.attributes
      atributos.delete("password_digest")
      JsonWebToken.encode(atributos)
    end
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def usuario
    usuario = Usuario.find_by(email: email)
    return usuario if usuario && usuario.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end