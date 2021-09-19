class Exame < ApplicationRecord
  validates_presence_of :nome, :descricao
  has_many :agendamentos
end
