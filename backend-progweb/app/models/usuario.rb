# Paciente: joao@email.com
# ProfissionalDaSaude: jj@email.com
# Administrador: j@email.com


class Usuario < ApplicationRecord
  has_secure_password

  TIPOS_PERMITIDOS = ["ProfissionalDaSaude", "Paciente", "Administrador"].freeze

  validates_presence_of :nome, :email, :sobrenome, :data_nascimento, :tipo, :password_digest
  validates :tipo, inclusion: { in: TIPOS_PERMITIDOS }
  validates :email, uniqueness: true, format: /\A\S+@.+\.\S+\z/
  validates_length_of :email, maximum: 256, minimum: 3

  def admin?
    self.tipo == "Administrador"
  end

  def paciente?
    self.tipo == "Paciente"
  end

  def profissional_da_saude?
    self.tipo == "ProfissionalDaSaude"
  end

  def qualquer_tipo
    true
  end
end
