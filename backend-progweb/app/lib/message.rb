class Message
  def self.not_found(record = 'record')
    "#{record} não encontrado."
  end

  def self.invalid_credentials
    'Credenciais inválidas.'
  end

  def self.invalid_token
    'Token inválido'
  end

  def self.missing_token
    'Token não encontrado'
  end

  def self.unauthorized
    'Requisição não autorizada'
  end

  def self.account_created
    'Conta criada com sucesso'
  end

  def self.account_not_created
    'Não foi possível criar a conta'
  end

  def self.expired_token
    'Seu token expirou. Faça login novamente.'
  end
end