class Paciente < ApplicationRecord
  has_one :usuario
  has_many :agendamentos

  validates_presence_of :usuario
end
