class PacienteSerializer < ActiveModel::Serializer
  attributes :id 
  has_many :agendamentos
  has_one :usuario
end
