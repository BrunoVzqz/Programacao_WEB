class Resultado < ApplicationRecord
  belongs_to :agendamento
  validates_presence_of :informacoes, :agendamento
end
