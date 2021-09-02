class Paciente < ApplicationRecord
  has_one :usuario, dependent: :destroy
  has_many :agendamentos

  validates_presence_of :usuario
end
