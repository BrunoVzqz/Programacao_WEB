class ProfissionalDaSaudeSerializer < ActiveModel::Serializer
  attributes :id
  has_many :agendamentos
  has_one :usuario
  belongs_to :clinica

  
end
