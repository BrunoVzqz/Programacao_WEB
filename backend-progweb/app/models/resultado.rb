class Resultado < ApplicationRecord
  belongs_to :agendamento
  validates_presence_of :informacoes, :agendamento
  validates_length_of :informacoes, minimum: 3
end
