class ChangeAgendamementoInExame < ActiveRecord::Migration[6.1]
  def change
    change_column_null :exames, :agendamento_id, true
  end
end
