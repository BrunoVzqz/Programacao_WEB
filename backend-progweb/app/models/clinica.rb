class Clinica < ApplicationRecord 

  has_many :profissionais_da_saude, :class_name => "ProfissionalDaSaude" 

  validates_presence_of :endereco, :nome, :telefone
  validates_uniqueness_of :endereco, :telefone
  validates_length_of :endereco, maximum: 256, minimum: 8
  validates_length_of :nome, maximum: 63, minimum: 3
  validates :telefone, format: 
  { with: /(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))\z/, 
  message: "Telefone inválido" } # Exemplos válidos: +55 (11) 98888-8888 / 9999-9999 / 21 98888-8888 / 5511988888888

end
