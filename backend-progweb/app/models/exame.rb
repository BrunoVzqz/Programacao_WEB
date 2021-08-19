class Exame < ApplicationRecord
  belongs_to :agendamento, optional: true

  validates_presence_of :nome, :descricao
end
