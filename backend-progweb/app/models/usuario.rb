class Usuario < ApplicationRecord
  has_secure_password

  TIPOS_PERMITIDOS = ["ProfissionalDaSaude", "Paciente"].freeze

  validates_presence_of :nome, :email, :sobrenome, :data_nascimento, :tipo, :password_digest
  validates :tipo, inclusion: { in: TIPOS_PERMITIDOS }
  validates :email, uniqueness: true, format: /\A\S+@.+\.\S+\z/
  validates_length_of :email, maximum: 256, minimum: 3
end
