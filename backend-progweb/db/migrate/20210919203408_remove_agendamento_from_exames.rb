class RemoveAgendamentoFromExames < ActiveRecord::Migration[6.1]
  def change
    remove_reference :exames, :agendamento, null: false, foreign_key: true
  end
end
