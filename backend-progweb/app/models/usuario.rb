class Usuario < ApplicationRecord
  has_secure_password

  TIPOS_PERMITIDOS = ["ProfissionalDaSaude", "Paciente", "Administrador"].freeze

  validates_presence_of :nome, :email, :sobrenome, :data_nascimento, :tipo, :password_digest
  validates :tipo, inclusion: { in: TIPOS_PERMITIDOS }
  validates :email, uniqueness: true, format: /\A\S+@.+\.\S+\z/
  validate :paciente_ou_medico
  validates_length_of :password, maximum: 256, minimum: 3
  validates_length_of :email, maximum: 256, minimum: 3
  validates_length_of :nome, :sobrenome, maximum: 255, minimum: 2

  
  def paciente_ou_medico
    unless paciente_id.nil? || profissional_da_saude_id.nil? 
      errors.add(:usuario, message: "Um usuário não pode ser um paciente e um profissional da saúde")
    end
  end
  
  def admin?
    self.tipo == "Administrador"
  end

  def paciente?
    self.tipo == "Paciente"
  end

  def profissional_da_saude?
    self.tipo == "ProfissionalDaSaude"
  end

  def qualquer_tipo?
    self.admin? || self.paciente? || self.profissional_da_saude?
  end
end
