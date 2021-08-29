class Exame < ApplicationRecord
  validates_presence_of :nome, :descricao
end
