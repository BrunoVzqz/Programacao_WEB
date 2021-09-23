class Exame < ApplicationRecord
  validates_presence_of :nome, :descricao
  validates_length_of :nome, maximum: 255, minimum: 3
  validates_length_of :descricao, minimum: 3
  has_many :agendamentos
end
