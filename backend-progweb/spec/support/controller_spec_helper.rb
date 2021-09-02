module ControllerSpecHelper
  # generate tokens from user id
  def token_generator(usuario_id)
    JsonWebToken.encode(usuario_id: usuario_id)
  end

  # generate expired tokens from user id
  def expired_token_generator(usuario_id)
    JsonWebToken.encode({ usuario_id: usuario_id }, (Time.now.to_i - 10))
  end

  # return valid headers
  def valid_headers
    {
      "Authorization" => token_generator(usuario.id),
      "Content-Type" => "application/json"
    }
  end

  # return invalid headers
  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end
end