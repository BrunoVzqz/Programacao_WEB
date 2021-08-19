class Agendamento < ApplicationRecord
  belongs_to :profissional_da_saude
  belongs_to :paciente

  has_one :exame

  SITUACOES_PERMITIDAS = ["Aberto", "Concluido", "Cancelado"].freeze

  validates_presence_of :profissional_da_saude, :paciente, :data, :situacao, :exame
  validates :situacao, inclusion: { in: SITUACOES_PERMITIDAS }

  scope :filtra_aberto,    -> { where(situacao: "Aberto")    }
  scope :filtra_concluido, -> { where(situacao: "Concluido") }
  scope :filtra_fechado,   -> { where(situacao: "Fechado")   }
end
