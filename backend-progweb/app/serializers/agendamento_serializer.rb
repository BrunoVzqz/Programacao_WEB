class AgendamentoSerializer < ActiveModel::Serializer
  attributes :id, :data, :situacao, :profissional_da_saude_id, :paciente_id, :exame, :resultado

  belongs_to :profissional_da_saude
  belongs_to :paciente
  belongs_to :exame
  
  has_one :resultado
end
