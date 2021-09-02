class AgendamentoSerializer < ActiveModel::Serializer
  attributes :id, :data. :situacao

  belongs_to :profissional_da_saude
  belongs_to :paciente

  has_one :exame
  has_one :resultado
end
