module ControllerSpecHelper
  # generate tokens from user id
  def token_generator(usuario)
    JsonWebToken.encode(usuario)
  end

  # generate expired tokens from user id
  def expired_token_generator(usuario)
    JsonWebToken.encode(usuario, (Time.now.to_i - 10))
  end

  # return valid headers
  def valid_headers
    {
      "Authorization" => token_generator(usuario.attributes),
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