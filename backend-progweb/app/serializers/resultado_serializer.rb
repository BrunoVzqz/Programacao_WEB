class ResultadoSerializer < ActiveModel::Serializer
  attributes :id, :informacoes

  belongs_to :agendamento
end