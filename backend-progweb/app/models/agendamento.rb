class Agendamento < ApplicationRecord
  belongs_to :profissional_da_saude
  belongs_to :paciente

  has_one :exame
  has_one :resultado

  SITUACOES_PERMITIDAS = ["A Confirmar", "Aberto", "Concluido", "Cancelado"].freeze

  validates_presence_of :profissional_da_saude, :paciente, :data, :situacao, :exame
  validates :data, uniqueness: { scope: :profissional_da_saude_id }
  validates :data, uniqueness: { scope: :paciente_id }
  validates :situacao, inclusion: { in: SITUACOES_PERMITIDAS }

  scope :filtra_a_confirmar, -> { where(situacao: "A Confirmar") }
  scope :filtra_aberto,      -> { where(situacao: "Aberto")      }
  scope :filtra_concluido,   -> { where(situacao: "Concluido")   }
  scope :filtra_cancelado,   -> { where(situacao: "Cancelado")   }
end
